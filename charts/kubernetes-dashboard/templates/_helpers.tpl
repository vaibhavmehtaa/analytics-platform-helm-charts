{{/*
hostname
*/}}
{{- define "hostname" -}}
"{{ .Values.ingress.host }}"
{{- end -}}
