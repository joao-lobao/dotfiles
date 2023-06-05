;;  This configuration is guile based:
;;  http://www.gnu.org/software/guile/guile.html
;;  Script adapted from:
;;  https://askubuntu.com/a/958608 and https://askubuntu.com/a/1118410

(define actionperformed #false)

;; Left Click
(define (first-binding)
    "First binding"
    (xbindkey-function '("b:1") b1-second-binding)
    (xbindkey-function '("b:3") b3-second-binding)
)

(define (unset-first-binding)
    "unset first binding"
    (ungrab-all-keys)
    (remove-all-keys)
    (set! actionperformed #false)
)

(define (start-first-binding)
    "start first binding"
    (first-binding)
    (grab-all-keys)
)

(define (b1-second-binding)
    "Button Extra Functions"
    (unset-first-binding)
    (start-first-binding)

    (xbindkey-function '("b:4")
        (lambda ()
            (set! actionperformed #true)
            (run-command "xdotool key 'semicolon'")
        )
    )

    (xbindkey-function '("b:5")
        (lambda ()
            (set! actionperformed #true)
            (run-command "xdotool key 'colon'")
        )
    )

    (xbindkey-function '(release "b:1")
        (lambda ()
            (if (not actionperformed)
                (begin
                    (unset-first-binding)
                    (run-command "xdotool click 1; xbindkeys --poll-rc")
                )
            )
        )
    )
)

(define (b3-second-binding)
    "Button Extra Functions"
    (unset-first-binding)
    (start-first-binding)

    (xbindkey-function '("b:4")
        (lambda ()
            (set! actionperformed #true)
            (run-command "xdotool key 'Left'")
        )
    )

    (xbindkey-function '("b:5")
        (lambda ()
            (set! actionperformed #true)
            (run-command "xdotool key 'Right'")
        )
    )

    (xbindkey-function '(release "b:3")
        (lambda ()
            (if (not actionperformed)
                (begin
                    (unset-first-binding)
                    (run-command "xdotool click 3; xbindkeys --poll-rc")
                )
            )
        )
    )
 )

(first-binding)
