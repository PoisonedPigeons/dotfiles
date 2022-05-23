(ql:quickload :swank)

(defcommand swank () ()
	    "This function starts the Swank server and tells the user how to connect to it."
	    (swank:create-server :port 4005
				 :style swank:*communication-style*
				 :dont-close t)
	    (stumpwm:echo-string (stumpwm:current-screen)
				 "Starting swank. M-x slime-connect RET RET, then (in-package stumpwm)."))

(defcommand swank-end () ()
	    "This function ends the Swank server and tells the user."
	    (swank:stop-server 4005)
	    (stumpwm:echo-string (stumpwm:current-screen)
				 "Killing swank"))

(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "C-z") "swank")
(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "M-z") "swank-end")

(stumpwm:run-commands "exec nitrogen --restore")

(stumpwm:toggle-mode-line (stumpwm:current-screen)
			(stumpwm:current-head))

(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioRaiseVolume")
  "exec sh -c \"pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +2%\"")

(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioLowerVolume")
  "exec sh -c \"pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -2%\"")

(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioMute")
  "exec sh -c \"pactl set-sink-mute 0 true\"")

(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioPlay") "exec mpc toggle")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioNext") "exec mpc next")
(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "XF86AudioPrev") "exec mpc prev")

(stumpwm:define-key stumpwm:*top-map* (stumpwm:kbd "s-XF86AudioPlay") "exec konsole --hide-tabbar --hide-menubar -e ncmpcpp")

(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "c") "exec konsole")
(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "C-c") "exec konsole")

(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "s-f") "exec firefox")
(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "s-F") "exec firefox --private-window")

(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd ".") "loadrc")
(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "C-.") "reload")

(stumpwm:load-module "app-menu")

(stumpwm:define-key stumpwm:*root-map* (stumpwm:kbd "s-.") "show-menu")

(setq app-menu:*app-menu*
      '(("Internet"
	 ("Firefox" "exec firefox") ; Open Firefox
	 ("Firefox (Private)" "exec firefox --private-window") ; Open Firefox (Private)
	 ("Nyxt" "exec nyxt") ; Open Nyxt
	 )
	("Text Editors"
	 ("Emacs" stumpwm:emacs))))

(stumpwm:load-module "swm-golden-ratio")
(swm-golden-ratio:toggle-golden-ratio)

(setq stumpwm:*window-format* "%m%n%s%30t")

(stumpwm:load-module "battery-portable")
(stumpwm:load-module "hostname")

(setq stumpwm:*screen-mode-line-format* "[^B%n^b] %W ^B| %B - %d (%h)^b")
