;;; llm.el --- Provide features for interracting with llms -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package gpt)

(use-package mcp-hub
 :config
 (setopt mcp-hub-servers))


(provide 'my-llm)

;;; llm.el ends here
