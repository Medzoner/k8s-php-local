{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.docker_registry (printf "%s:%s" .Values.docker_username .Values.docker_password | b64enc) | b64enc }}
{{- end }}