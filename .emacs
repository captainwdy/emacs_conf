;;Load_path
(add-to-list 'load-path' "~/.emacs.d/emacs-lisp")

;;设置中文配置为utf-8
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system
            '(euc-cn . euc-cn))
(setq-default pathname-coding-system 'utf-8)

;;中文识别的插件
;;(require 'unicad)

;;启用时间显示设置
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间的变化频率
(setq display-time-interval 10)
;;显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t) 

;;主题设置
;;24.3的bug，没有plist-to-alist函数
;;(defun plist-to-alist (the-plist)
;;  (defun get-tuple-from-plist (the-plist)
;;    (when the-plist
;;      (cons (car the-plist) (cadr the-plist))))
;;
;;  (let ((alist '()))
;;    (while the-plist
;;      (add-to-list 'alist (get-tuple-from-plist the-plist))
;;      (setq the-plist (cddr the-plist)))
;;  alist))

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-lisp/solarized")
(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'light)    ;;选择solarized dark,light
(enable-theme 'solarized)

;;(require 'color-theme) 
;;(color-theme-fischmeister)
;;(color-theme-euphoria)
;;(require 'color-theme-wdy)
;;(require 'color-theme-ahei)

;; M-x desktop-save。以后 Emacs 启动时就会打开你上次离开时的所有 buffer.
;;(load "desktop") 
;;(require 'desktop)
;;(setq desktop-save t)
;;(setq desktop-load-locked-desktop t)
;;(setq *desktop-dir* (list (expand-file-name "~/.emacs.d/desktop")))
;;(setq desktop-path '("~/.emacs.d/desktop"))
;;(setq desktop-dirname "~/.emacs.d/desktop")
;;(setq desktop-base-file-name ".emacs-desktop")
;;(desktop-save-mode 1)
;;(desktop-read)
(require 'session)
(add-hook 'after-init-hook
		  'session-initialize)

(require 'ibuffer)
(global-set-key(kbd "C-x C-b") 'ibuffer)

(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
    try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))
(global-set-key (kbd "<C-tab>") 'hippie-expand)

;;设置缩进
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4) 
(setq tab-width 4)   
(setq c-basic-offset 4)  
(setq tab-stop-list ())

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;;不要生成临时文件
(setq-default make-backup-files nil)
;;禁用启动信息
(setq inhibit-startup-message t) 
;;语法高亮
(global-font-lock-mode t)
;;设置行号
(require 'wb-line-number)
;;(add-hook 'after-init-hook 'wb-line-number-enable)
(wb-line-number-toggle)
(global-set-key (kbd "C-x l") 'wb-line-number-toggle)
;;(wb-line-number-enable)
;;(setq column-number-mode t)
;; 默认显示 80列就换行  
(setq default-fill-column 100)  
;;设置windows number
(require 'window-numbering)
(window-numbering-mode 1)
;;键绑定
(global-set-key [f5] 'compile)
;;gtags
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-common-hook
          '(lambda()
             (when (derived-mode-p 'c-mode 'c++-mode)
	       (gtags-mode 1)
	       (gtags-make-complete-list)
             )))
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;;auto complete
(add-to-list 'load-path "/home/wangdayao/.emacs.d/emacs-lisp")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/wangdayao/.emacs.d/emacs-lisp/ac-dict")
(ac-config-default)

(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")

(defun now()
(interactive)
(insert(format-time-string "%Y/%m/%d %H:%M:%S")))

(defun comment()
(interactive)
(insert "#!/usr/bin/env python \n# -*- coding: utf-8 -*-\n")
(insert "#File:")
(insert(buffer-name))
(insert "\n#Author: wangdayao(captainwdy@163.com)\n")
(insert "#Date: ")
(insert(format-time-string "%Y/%m/%d %H:%M:%S"))
(insert "\n#Descrip:"))

;;ecb 设置
(add-to-list 'load-path "~/.emacs.d/emacs-lisp/ecb")
(require 'ecb)
(defun ecb-active-or-deactive ()  
  (interactive)  
  (if ecb-minor-mode  
      (ecb-deactivate)  
    (ecb-activate)))  

(global-set-key (kbd "C-x ;") 'ecb-active-or-deactive)
;;(require 'ecb-autoloads)
;;(require 'edit-window)
(setq ecb-layout-name "right1")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
