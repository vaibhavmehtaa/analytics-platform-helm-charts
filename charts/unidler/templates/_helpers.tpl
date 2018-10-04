{{/*
Hostname
*/}}
{{- define "hostname" -}}
{{ .Release.Name }}.{{ .Values.servicesDomain }}
{{- end -}}
