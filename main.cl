(defun main ()
  (setq BF NIL)
  (AskBF)
  (let ((continue2 T)(continue1 T)(answer NIL))
      (loop while continue1 do
        (progn
           (setq continue2 T)
           (setq RecettesPossibles NIL)
           (RecettesValides)
           (if (eq RecettesPossibles NIL)
                (progn
                    (format t "Aucune recette n'est valide :/ ~%")
                    (setq continue2 nil)
                    (setq continue1 nil)
                 )
                (progn
                    (format t "~%Voici les recettes valides : ~%")
                    (dolist (x RecettesPossibles)
                        (format t "~A~%" x)
                    )
                )
           )
           (loop while continue2 do
               (progn
                (format t "~%Qu'elle recette choississez-vous ? Taper STOP pour arreter ~%")
                (setq answer (read))
                (if (not (eq (assoc answer RecettesPossibles) nil))
                    (progn
                        (setq answer (assoc answer RecettesPossibles))
                        (setq continue2 nil)
                        (format t "~A" (car answer))
                        (format t "a bien ete choisi ! ~%" )
                        (UpdateBF answer)
                      )
                  (if (equal answer 'STOP)
                      (progn
                        (setq continue2 nil)
                        (setq continue1 nil))
                    (format t "Saisie invalide : Reesayez")
                  )
                 )
               )
           )
        )
      )
  )
)

(main)

