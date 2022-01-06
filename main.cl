
(defun main ()
  ;(setq BF NIL)
  ;(AskBF)
  (let ((continue2 T)(continue1 T)(answer NIL))
      (loop while continue1 do
           (setq RecettesPossibles NIL)        
           (RecettesValides)
           (format t "~Voici les recettes valides : ~%")
           (dolist (x RecettesPossibles)
                (format t "~A~%" x)        )
           (loop while continue2 do
           (
            (format t "~%Qu'elle recette choississez-vous ? Taper STOP pour arreter ~%")
            (setq answer (read))
            (if (not (eq (assoc answer RecettesPossibles) nil))
                (progn
                    (setq answer (assoc answer RecettesPossibles))
                    (setq continue2 nil)
                  )
              (if (equal answer 'STOP)
                  (progn
                    (setq continue2 nil)
                    (setq continue1 nil))
                (format t "Saisie invalide : Reesayez"))
             )
           ))
        )
    )
  )

(main)

tant que utilisateur ne rentre pas stop 
 (defparameter RecettesPossibles NIL)
 (RecettesValides) 
 choix de utilisateur 
update bf
