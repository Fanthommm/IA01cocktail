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

(defun IsKnown (BR element)
        (loop while BR
            do
            (let ((tmp (assoc element (cadr (pop BR)))))
                (if tmp (return-from IsKnown (car tmp)))
            )
        )
)
;(IsKnown BR_Recette 'vodka)
;(IsKnown BR_Recette 'poupi)
         
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


;DIFFICULTE PAR DEFAULT = 5
;ALCOLEMIE PAR DEFAULT = 3

(defun UpdateBF (regle BF)
    (let ((retirer (ListIngredients regle)))
        (dolist (x retirer BF)
            (if (not (eq (assoc x BF) nil))
                (setq BF (rplacd (assoc x BF) (- (cadr (assoc x BF)) (cadr x))))
            )
        )
    )
)

(defun SearchReplacement (ingredient regle Bremplacement)
  (let ((regle2 (copy-tree (cadr regle)))(remplacant (cdr (assoc ingredient Bremplacement))))
        (setq regle2 (rplaca (assoc ingredient regle2) remplacant))
        (return-from SearchReplacement regle2)
    )
  )

(searchreplacement 'jus_citron (caddr(cddr(cddr(cddr(cddr BR_Recette))))) BR_Ingredient_Similaires)
