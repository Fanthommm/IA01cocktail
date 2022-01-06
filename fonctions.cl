;FONCTIONS

(defun ListIngredients (regle)
    (let ((Liste nil)(regle (cadr regle)))
        ;(format t "~s" regle)
        (loop until (or (eq (car (car regle)) 'difficulte) (eq (car (car regle)) nil))
            do (push (pop regle) Liste)
        )
        (return-from ListIngredients Liste)
    )
 )

(ListIngredients (car BR_Recette))
 


;Verifier si l'élement entrée en param est connu dans la Base de Règle
(defun IsKnown (element)
    (dolist (x BR_Recette)
        (let ((tmp (assoc element (cadr x))))
            (if tmp (return-from IsKnown (car tmp)))
        )
<<<<<<< Updated upstream
  )

;(IsKnown BR_Recette 'vodka)
;(IsKnown BR_Recette 'poupi)
         
=======
    )
)
       
>>>>>>> Stashed changes
(defun AskBF (BR BF)
    (format t "Quels ingredients possedez vous dans votre armoire ?~%")
    (format t "(Ecrivez STOP pour arreter)~%")
    (setq answer (read))
    (if (equal answer 'STOP) (return-from AskBF (AskCriteria BF)) ;AskCriteria demande les criteres supplementaires (ex : petillance)
        (progn
            (let ((name (IsKnown answer))) ;IsKnown regarde si l'ingredient est connu dans la liste des recettes (retourne ingredient si oui NIL sinon)
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

    (let ((break T)) ;break servira � interrompre la boucle si la saisie est correcte
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

    (let ((break T)) ;break servira a� interrompre la boucle si la saisie est correcte
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

    (format t "~A~%" (reverse BF))
    (return-from AskCriteria (reverse BF))
)
(AskBF BR_Recette nil)

; CHECKER PQ CA MARCHE PAS CHEZ CLEA AVEC CHARACTEr

<<<<<<< Updated upstream
;DIFFICULTE PAR DEFAULT = 5
;ALCOLEMIE PAR DEFAULT = 3

(defun UpdateBF (regle BF)
  (let ((retirer (ListIngredients regle)))
        (dolist (x retirer BF)
            (if (not (eq (assoc (car x) BF) nil))
                (setq BF (rplacd (assoc (car x) BF) (- (cadr (assoc (car x) BF)) (cadr x))))
            )
        )
    )
)

(UpdateBF (car BR_Recette) BF)

(defun SearchReplacement (ingredient regle)
  (let ((regle2 (copy-tree (cadr regle)))(remplacant (cdr (assoc ingredient BR_Ingredient_Similaires))))
        (setq regle2 (rplaca (assoc ingredient regle2) remplacant))
        (return-from SearchReplacement regle2)
    )
)
(SearchReplacement 'jus_citron (caddr(cddr(cddr(cddr(cddr BR_Recette))))))


=======
(defun SearchReplacement (ingredient regle Bremplacement)
  (let ((regle2 (copy-tree (cadr regle)))(remplacant (cdr (assoc ingredient Bremplacement))))
        (setq regle2 (rplaca (assoc ingredient regle2) remplacant))
        (return-from SearchReplacement regle2)
    )
  )

(searchreplacement 'jus_citron (caddr(cddr(cddr(cddr(cddr BR_Recette))))) BR_Ingredient_Similaires)

;Retourne les conditions d'une recette, donc ses ingrédients et ses caracteristiques
(defun conditions (recette)
  (cadr (assoc recette BR_Recette))  )
;Tests
(conditions 'margarita)


;Retourne que les ingrédients d'une regle
(defun ListIngredients (regle)
    (let ((Liste nil)(regle (cadr regle)))
        ;(format t "~s" regle)
        (loop until (or (eq (car (car regle)) 'difficulte) (eq (car (car regle)) nil))
            do (push (pop regle) Liste)
        )
        Liste
    )
  )
;Test
(ListIngredients '(perroquet ((sirop_menthe 2) (ricard 4) (eau 8) (difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 2))))

(defun ListCriterias (regle)
    (let ((Liste nil)(regle (cadr regle)))
        ;(format t "~s" regle)
        (loop until (or (eq (car (car regle)) 'difficulte) (eq (car (car regle)) nil))
            do (pop regle)
        )
        (loop until (eq (car (car regle)) nil)
            do (push (pop regle) Liste)
        )
        Liste
    )
  )
(ListCriterias '(perroquet ((sirop_menthe 2) (ricard 4) (eau 8) (difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 2))))


;Retourne t si les attributs petillant et fruite sont accepté en fonction de ce que l'utilisateur a demandé, nul si non
(defun TestValidityBool (x)
  (if (OR (eq (cadr (assoc (car x) BF)) (cadr x))
      (eq -1 (cadr (assoc (car x) BF))))                      ;Si le caractere petillant est == de celui demandé par l'utilisateur, ou si celui de l'utilisateur est == - 1
            (return-from TestValidityBool t))
  (return-from TestValidityBool NIL))

;Test
(TestValidityBool '(petillant 1))      ;Retourne t si dans la BF on a (petillant 1) ou (petillant -1)


;retourne une nouvelle recette avec l'ingrédient a remplacer (IAR) remplacé par l'ingredient remplacant (IR)
(defun replacement (IR IAR recette)
  (let ((NewRecette NIL) (newtemp NIL))
    (if (assoc (car IR) (cadr recette)) ;si l'ingr�dient remplacant est pr�sent dans la recette
        (push (list (car IR) (+ (cadr (assoc (car IR) (cadr recette))) (cadr IR))) newtemp) ;on additionne simplement les quantit� d'IR additionnelles et celles d�ja pr�sente dans la recette
        (push (list (car IR) (* (cadr IAR) (cadr IR))) newtemp)) ;sinon on multiplie la quantit� d'IAR par la quantit� d'IR (n�cessaire pour remplacer 1 IAR)
    (dolist (x (cadr recette) newtemp)
      (if (And (not(equal x IAR)) (not(equal (car x) (car IR)))) ;re-push toutes les caract�ristiques supplementaires
          (push X newtemp)
      )
      )
     (setq NewRecette (list (concatenate 'string "IA_" (format nil "~{~a~}" (list (car recette)))) (reverse newtemp)))
))



;(searchreplacement (liste_ingredient_quantite recette))
 ;Si il existe une regle avec cet ingrédient dans la base:
 ;Pour chaque ingrédients remplacant, ou liste d'ingredients remplaçant: (faire un dolist)
 ;      regarder si l'utilisateur possède tous les elements de cette liste et EN BONNE QUANTITE (refaire un dolist)
 ;      si oui :
 ;             modifier la recette passé en parametre en remplacant l'igrédient par tous les ingrédients qui la remplacent
 ;             retourner la recette
 ;      si non : continuer
 ;si la fonction ne s'est pas arrété a cette etape c'est qu'il n'a pas trouvé de remplaçant donc on renvoit nill


(defun SearchReplacement(IAR recette)                                 ;IAR :ingredient a remplacer
  (if (assoc (car IAR) BR_Ingredient_Similaires)                      ;Si l'ingredient a remplacer possède des ingredients remplacant dans notre base de donnée
        (let ((LIR (cadr (assoc (car IAR) BR_Ingredient_Similaires))) (New_recette NIL) (QIAR (cadr IAR)))            ;QIAR quantite ingredient a remplacer    ; LIR liste ingredients remplacants   ; IAR ingredient a remplacer
          (dolist (IR LIR New_Recette)                                      ;On parcours tous les elements remplacants possibles
            ;;(format t "~A~%" IR)
            (if (not New_recette)                                      ;Si on a pas déja trouvé un element remplacant possible et instancié une nouvelle recette
                (let ((QIR (cadr IR)))
                  ;;(format t "~A~%" (car IR))
                  (if (assoc (car IR) BF)                                         ;Si l'utilisateur possede l'element
                    (if (< (* QIR QIAR) (cadr (assoc (car IR) BF)))                   ;Si l'utilisateur possede la quantité suffisante
                        (setq New_recette  (replacement IR IAR recette))
                    )
                  )
                 )
              )
            )
    )
  nil
))



;Test
(SearchReplacement '(jus_citron 1) '(margarita ((tequila 4) (triple_sec 2) (citron 2) (jus_citron 1) (difficulte 2) (petillant 0) (fruite 0) (niveau_alcoolemie 2))))
;---> ("IA_MARGARITA" ((CITRON 2) (TEQUILA 4) (TRIPLE_SEC 2) (DIFFICULTE 2) (PETILLANT 0) (FRUITE 0)  (NIVEAU_ALCOOLEMIE 2)))





;Retourne la recette si une recette est valide NIl si non
(defun TestValidity (recette)
  (let ((condition NIL) (RecetteReturned recette))
    (if (assoc (car recette) BR_Recette)
        (setq condition (conditions (car recette)))
        (setq condition (cadr recette)))
    (dolist (x condition recette)                                              ; on parcours tous les elements conditions de la recette
      (if (equal RecetteReturned recette)
      (if (OR (eq (car x) 'petillant ) (eq (car x) 'fruite ) )   ; Si l'element est la caracteristique petillant ou fruite
          (if (eq (TestValidityBool x) NIL)
              (return-from TestValidity NIL))
                                                                  ; L'element est soit un ingredient, soit difficulte, ou nv_alcoolemie,
          (if (NOT (assoc (car x) BF))                            ; On verifie si l'element est dans la base de fait
                                                                          ; L'element n'est pas dans la base de fait
            (if (NOT (OR (eq (car x) 'difficulte ) (eq (car x) 'niveau_alcoolemie ))) ;Si l'element est un ingredient
                (if (searchreplacement x recette)                                                 ; Si il y a un remplaçant
                    (setq RecetteReturned (TestValidity (searchreplacement x recette)))      ; On rappel testvalidity avec la nouvelle recette
                    (setq RecetteReturned NIL)))                                        ; Si non on retourne NIL
            (if (< (cadr (assoc (car x) BF))(cadr x))                     ; L'element y est, on cherche si la quantité du placard est < à la quantité demandé dans la recette
                (if (searchreplacement x recette)                                                 ; Si il y a un remplaçant
                    (setq RecetteReturned (TestValidity (searchreplacement x recette)))      ; On rappel testvalidity avec la nouvelle recette
                    (setq RecetteReturned NIL)))                                        ; Si non on retourne NIL
     ))))
    RecetteReturned
    ))

;Test
(TestValidity '(punch ((sirop_sucre 2) (rhum 5) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 2))))
(TestValidity '(cocktail_du_pauvre1 ((vodka 13) (sirop_citron 6) (eau 14) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 3))))
(TestValidity '(cocktail_du_pauvre2 ((vodka 13) (sirop_grenadine 6) (eau 14) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 3))))
(TestValidity '(cocktail_du_pauvre3 ((vodka 13) (sirop_menthe 6) (eau 14) (difficulte 1) (petillant 0) (fruite 0) (niveau_alcoolemie 3))));; ---> FAUX
(TestValidity '(melon_ball ((jus_citron 2) (jus_ananas 2) (vodka 6) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 2))))
(TestValidity '(margarita ((tequila 4) (triple_sec 2) (citron 2) (jus_citron 1) (difficulte 2) (petillant 0) (fruite 0) (niveau_alcoolemie 2))))
(TestValidity (searchreplacement '(jus_ananas 6) '(melon_ball ((jus_ananas 6) (vodka 6) (jus_citron 2) (difficulte 1) (petillant 0) (fruite 1) (niveau_alcoolemie 2)))))

;;Si on a les attributs fruite et petillant il suffit de regarder si testValidityBool renvoi true et on continue, si renvoi false on arret
;;Si non il suffit de regarder si le deuxieme argument de la sous liste de la recette est >= a l'equivalent dans la base de fait






(defun RecettesValides ()        ;;Retourne l'ensemble des recettes valide en fonction des ingredients du placard de l'individu et des caracteristiques demandé par l'utilisateur
    (dolist (recette BR_Recette) ;;On parcours toutes les recettes de notre base de règle et on regarde si elle sont valides
      (if (TestValidity recette)
          (push (TestValidity recette) RecettesPossibles)))
  RecettesPossibles)
;Strategie de chainage avant
;Rajouter cimetiere

;Test
(defparameter RecettesPossibles NIL)
(RecettesValides)





(defun AskBF ()
    (format t "Quels ingredients possedez vous dans votre armoire ?~%")
    (format t "(Ecrivez STOP pour arreter)~%")
    (setq answer (read))
    (if (equal answer 'STOP) (return-from AskBF (AskCriteria BF)) ;AskCriteria demande les criteres supplementaires (ex : petillance)
        (progn
            (let ((name (IsKnown answer))) ;IsKnown regarde si l'ingredient est connu dans la liste des recettes (retourne ingredient si oui NIL sinon)
                (if name (progn
                    (format t "Quelle quantite possedez-vous ?~%")
                    (setq answer (read))
                     (if (and (numberp answer) (> answer 0)) (addInBF (list name answer))
                        (format t "Quantite invalide ~%")
                     )
                    )
                    (format t "L'ingredient est inconnu :/ ~%")
                )
            )
            (AskBF)
        )
    )
)

(defun addInBf (toAdd)
    (if (assoc (car toAdd) BF)
        (let ((tmp nil))
            (dolist (x BF)
                (if (eq (car x) (car toAdd))
                    (push (list (car x) (+ (cadr x) (cadr toAdd))) tmp)
                    (push x tmp)
                )
            )
            (setq BF (reverse tmp))
        )
        (push toAdd BF)
    )
)
(addInBF '(gin 1))

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
    (reverse BF)
)
;Test
(AskBF)


(defun UpdateBF (recette)
    (let ((tmp NIL)(recette (cadr recette))(stop nil))
        (dolist (x BF tmp)
          (format t "~A~%" (car x))
          (if (eq (car x) 'DIFFICULTE) (setq stop T))
            (if (and (assoc (car x) recette) (eq stop nil))
                (if (> (- (cadr x) (cadr (assoc (car x) recette))) '0)
                    (push (list (car x) (- (cadr x) (cadr (assoc (car x) recette)))) tmp)
                )
                (push x tmp)
            )
        )
    (setq BF (reverse tmp))
    )
)
(UpdateBF '(punch ((sirop_sucre 2) (rhum 5) (citron 1) (difficulte 2) (petillant 0) (fruite 1) (niveau_alcoolemie 2))))
>>>>>>> Stashed changes
