                                                                                                    
(defun conditions (recette)                                       ;Retourne les conditions d'une recette, donc ses ingrédients et ses caracteristiques     
  (cadr (assoc recette BR_Recette))  )

;Tests
(conditions 'margarita)


(defun TestValidity (recette)                                     ;Retourne la recette si une recette est valide NIl si non 
  (let ((condition (conditions (car recette))))
    (dolist (x condition recette)                                              ; on parcours tous les elements conditions de la recette
      (if ( OR (eq (car x) 'petillant ) (eq (car x) 'fruite ) )   ; Si l'element est la caracteristique petillant ou fruite
          (if (eq (TestValidityBool x) NIL)
              (return-from TestValidity NIL))
                                                                  ; L'element est soit un ingredient, soit difficulte, ou nv_alcoolemie,
          (if (NOT (assoc (car x) BF))                            ; On verifie si l'element est dans la base de fait 
                                                                          ; L'element n'est pas dans la base de fait
            (if (NOT (OR (eq (car x) 'difficulte ) (eq (car x) 'niveau_alcoolemie ))) ;Si l'element est un ingredient    
                (if (replacement x recette)                                                 ; Si il y a un remplaçant          
                    (return-from TestValidity (TestValidity (replacement x recette) ))      ; On rappel testvalidity avec la nouvelle recette
                    (return-from TestValidity NIL)))                                        ; Si non on retourne NIL                                    
            (if (< (cadr (assoc (car x) BF))(cadr x))                     ; L'element y est, on cherche si la quantité du placard est < à la quantité demandé dans la recette
                (if (replacement x recette)                                                 ; Si il y a un remplaçant
                    (return-from TestValidity (TestValidity (replacement x recette) ))      ; On rappel testvalidity avec la nouvelle recette
                    (return-from TestValidity NIL)))                                        ; Si non on retourne NIL           
    )))
))

;Test
(TestValidity '(punch ((sirop_sucre 2) (rhum 5) (citron 1) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 2))))
(TestValidity '(cocktail_du_pauvre1 ((vodka 13) (sirop_citron 6) (eau 14) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 3))))
(TestValidity '(cocktail_du_pauvre2 ((vodka 13) (sirop_grenadine 6) (eau 14) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 3))))
(TestValidity '(cocktail_du_pauvre3 ((vodka 13) (sirop_menthe 6) (eau 14) (difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 3))));; ---> FAUX 

;;Si on a les attributs fruite et petillant il suffit de regarder si testValidityBool renvoi true et on continue, si renvoi false on arret 
;;Si non il suffit de regarder si le deuxieme argument de la sous liste de la recette est >= a l'equivalent dans la base de fait     




(defun TestValidityBool (x)                                   ;Retourne t si les attributs petillant et fruite sont accepté en fonction de ce que l'utilisateur a demandé, nul si non 
  (if (OR (eq (cadr (assoc (car x) BF)) (cadr x))
      (eq -1 (cadr (assoc (car x) BF))))                      ;Si le caractere petillant est == de celui demandé par l'utilisateur, ou si celui de l'utilisateur est == - 1              
            (return-from TestValidityBool t))
  (return-from TestValidityBool NIL))

;Test
(TestValidityBool '(petillant 1))      ;Retourne t si dans la BF on a (petillant 1) ou (petillant -1)




(defparameter RecettesPossibles NIL)

(defun RecettesValides ()        ;;Retourne l'ensemble des recettes valide en fonction des ingredients du placard de l'individu et des caracteristiques demandé par l'utilisateur 
    (dolist (recette BR_Recette) ;;On parcours toutes les recettes de notre base de règle et on regarde si elle sont valides 
      (if (TestValidity recette)
          (push (TestValidity recette) RecettesPossibles)))
  RecettesPossibles)
;Strategie de chainage avant 
;Rajouter cimetiere 

;Test
(RecettesValides)



(defun AskBF (BR BF)
    (format t "Quels ingredients possedez vous dans votre armoire ?~%")
    (format t "(Ecrivez STOP pour arreter)~%")
    (setq answer (read))
    (if (equal answer 'STOP) (return-from AskBF (AskCriteria BF)) ;AskCriteria demande les criteres supplementaires (ex : petillance)
        (progn
            (let ((name (IsKnown BR answer))) ;IsKnown regarde si l'ingredient est connu dans la liste des recettes (retourne ingredient si oui NIL sinon)
                (if name (progn
                    (format t "Quelle quantite possedez-vous ?~%")
                    (setq answer (read))
                     (if (and (numberp answer) (> answer 0)) (push (list name answer) BF)
                        (format t "Quantite invalide ~%")
                     )
                    )
                    (format t "L'ingredient est inconnu :/ ~%")
                )
            )
            (AskBF BR BF)
        )
    )
  )



(defun AskCriteria (BF)

    (let ((break T)) ;break servira à interrompre la boucle si la saisie est correcte
            (format t "Choix de la difficulte pour la recette [1-5] ?~%")
            (format t "(Entrez -1 si vous ne voulez pas imposer de restrictions particulières sur la difficulte)~%")
            (setq answer (read))
            (loop while (eq break T)
                do (if (numberp answer)
                    (progn
                        (if (or (> answer '5) (< answer '1)) (push (list 'difficulte 5) BF)
                            (push (list 'difficulte answer) BF)
                        )
                        (setq break nil)
                    )
                    (progn
                        (format t "Choix invalide ~%")
                        (format t "Choix de la difficulte pour la recette [1-5] ?~%")
                        (format t "(Entrez -1 si vous ne voulez pas imposer de restrictions particulières sur la difficulte)~%")
                        (setq answer (read))
                    )
                )
            )
        )

    (let ((break T)) ;break servira à interrompre la boucle si la saisie est correcte
        (format t "Choix de la petillance pour la recette [0 si non petillant, 1 si petillant] ?~%")
        (format t "(Entrez -1 si vous ne voulez pas imposer de restrictions particulieres sur la petillance)~%")
        (setq answer (read))
        (loop while (eq break T)
            do (if (numberp answer)
                (progn
                    (if (or (> answer '1) (< answer '0)) (push (list 'petillant -1) BF) ;si le nombre n'est pas compris dans l'intervalle prévu : on prend la valeur par défault -1
                        (push (list 'petillant answer) BF)
                    )
                    (setq break nil)
                )
                (progn
                    (format t "Choix invalide ~%")
                    (format t "Choix de la petillance pour la recette [0 si non petillant, 1 si petillant] ?~%")
                    (format t "(Entrez -1 si vous ne voulez pas imposer de restrictions particulieres sur la petillance)~%")
                    (setq answer (read))
                )
            )
        )
    )

    (let ((break T)) ;break servira à interrompre la boucle si la saisie est correcte
        (format t "Cocktail fruite ? [0 si non, 1 si oui] ?~%")
        (format t "(Entrez -1 si les deux)~%")
        (setq answer (read))
        (loop while (eq break T)
            do (if (numberp answer)
                (progn
                    (if (or (> answer '1) (< answer '0)) (push (list 'fruite -1) BF) ;si le nombre n'est pas compris dans l'intervalle prévu : on prend la valeur par défault -1
                                    (push(list 'fruite answer) BF)
                    )
                    (setq break nil)
                )
                (progn
                    (format t "Choix invalide ~%")
                    (format t "Cocktail fruite ? [0 si non, 1 si oui] ?~%")
                    (format t "(Entrez -1 si les deux)~%")
                    (setq answer (read))
                )
            )
        )
    )

    (let ((break T)) ;break servira à interrompre la boucle si la saisie est correcte
        (format t "Choix du taux d'alcool pour la recette [0-3] ?~%")
        (format t "(Entrez -1 si vous ne voulez pas imposer de restrictions particulieres sur le taux d'alcool)~%")
        (setq answer (read))
        (loop while (eq break T)
            do (if (numberp answer)
                (progn
                    (if (or (> answer '3) (< answer '0)) (push (list 'niveau_alcoolemie 3) BF)
                        (push (list 'niveau_alcoolemie answer) BF)
                    )
                    (setq break nil)
                )
                (progn
                    (format t "Choix invalide ~%")
                    (format t "Choix du taux d'alcool pour la recette [0-3] ?~%")
                    (format t "(Entrez -1 si vous ne voulez pas imposer de restrictions particulieres sur le taux d'alcool)~%")
                    (setq answer (read))
                )
            )
        )
    )

    ;(format t "~A~%" (reverse BF))
    (return-from AskCriteria (reverse BF))
  )

(AskBF BR_Recette nil)


(replacement (liste_ingredient_quantite recette)
 ;Si il existe une regle avec cet ingrédient dans la base:
 ;Pour chaque ingrédients remplacant, ou liste d'ingredients remplaçant: (faire un dolist)
 ;      regarder si l'utilisateur possède tous les elements de cette liste et EN BONNE QUANTITE (refaire un dolist) 
 ;      si oui :
 ;             modifier la recette passé en parametre en remplacant l'igrédient par tous les ingrédients qui la remplacent 
 ;             retourner la recette 
 ;      si non : continuer 
 ;si la fonction ne s'est pas arrété a cette etape c'est qu'il n'a pas trouvé de remplaçant donc on renvoit nill
