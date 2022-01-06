(defun main ()
    (setq BF nil)
    (AskBF)

    ;CREER UN MENU AVEC DEUX CHOIX : UN PREMIER BASE DE FAIT, UN DEUXIEME REGLE

    (let ((break T))
        (setq RecettesPossibles NIL)
        (RecettesValides)
        ;; dire quand aucune recette n'est possible
        (dolist (x RecettesPossibles)
            (format t "~A~%" x)
        )
      
        (loop while break
        do
        (
            (format t "~%Qu'elle recette choississez-vous ?~%")

            (setq answer (read))
            (if (not (eq (assoc answer RecettesPossibles) nil))
                (progn
                    (setq answer (assoc answer RecettesPossibles))
                    (setq break nil)
                )
                (format t "Saisie invalide : Reesayez")
            )
            (UpdateBF answer)
        ))
    )
)
(main)

