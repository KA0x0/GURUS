(use-package ellama
    :bind ("C-c e" . ellama-transient-main-menu)
    :init
    ;; setup key bindings
    ;; (setopt ellama-keymap-prefix "C-c e")
    ;; language you want ellama to translate to
    (setopt ellama-language "German")
    ;; could be llm-openai for example
    (require 'llm-ollama)
    (setopt ellama-provider
	  (make-llm-ollama
	       ;; this model should be pulled to use it
	       ;; value should be the same as you print in terminal during pull
	       :chat-model "llama3:8b-instruct-q8_0"
	       :embedding-model "nomic-embed-text"
	       :default-chat-non-standard-params '(("num_ctx" . 8192))))
    (setopt ellama-summarization-provider
	      (make-llm-ollama
	       :chat-model "qwen2.5:3b"
	       :embedding-model "nomic-embed-text"
	       :default-chat-non-standard-params '(("num_ctx" . 32768))))
    (setopt ellama-coding-provider
	      (make-llm-ollama
	       :chat-model "qwen2.5-coder:3b"
	       :embedding-model "nomic-embed-text"
	       :default-chat-non-standard-params '(("num_ctx" . 32768))))
    ;; Predefined llm providers for interactive switching.
    ;; You shouldn't add ollama providers here - it can be selected interactively
    ;; without it. It is just example.
    (setopt ellama-providers
	      '(("zephyr" . (make-llm-ollama
			     :chat-model "zephyr:7b-beta-q6_K"
			     :embedding-model "zephyr:7b-beta-q6_K"))
		("mistral" . (make-llm-ollama
			      :chat-model "mistral:7b-instruct-v0.2-q6_K"
			      :embedding-model "mistral:7b-instruct-v0.2-q6_K"))
		("mixtral" . (make-llm-ollama
			      :chat-model "mixtral:8x7b-instruct-v0.1-q3_K_M-4k"
			      :embedding-model "mixtral:8x7b-instruct-v0.1-q3_K_M-4k"))))
    ;; Naming new sessions with llm
    (setopt ellama-naming-provider
	      (make-llm-ollama
	       :chat-model "llama3:8b-instruct-q8_0"
	       :embedding-model "nomic-embed-text"
	       :default-chat-non-standard-params '(("stop" . ("\n")))))
    (setopt ellama-naming-scheme 'ellama-generate-name-by-llm)
    ;; Translation llm provider
    (setopt ellama-translation-provider
	    (make-llm-ollama
	     :chat-model "qwen2.5:3b"
	     :embedding-model "nomic-embed-text"
	     :default-chat-non-standard-params
	     '(("num_ctx" . 32768))))
    ;; customize display buffer behaviour
    ;; see ~(info "(elisp) Buffer Display Action Functions")~
    (setopt ellama-chat-display-action-function #'display-buffer-full-frame)
    (setopt ellama-instant-display-action-function #'display-buffer-at-bottom)
    :config
    ;; send last message in chat buffer with C-c C-c
    (add-hook 'org-ctrl-c-ctrl-c-hook #'ellama-chat-send-last-message))

(provide 'my-llm)

;;; llm.el ends here
