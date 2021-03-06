{{/*
Control Panel hostname
*/}}
{{- define "host" -}}
{{- printf "controlpanel.%s" .Values.servicesDomain -}}
{{- end -}}

{{/*
Old Control Panel API hostname
*/}}
{{- define "old_host" -}}
"cpanelapi{{- if .Values.branch -}}-{{ .Values.branch }}{{- end -}}.{{ .Values.servicesDomain }}"
{{- end -}}

{{/*
Old Control Panel Frontend hostname
*/}}
{{- define "old_cpfrontend_host" -}}
"cpanel{{- if .Values.branch -}}-{{ .Values.branch }}{{- end -}}.{{ .Values.servicesDomain }}"
{{- end -}}

{{/*
Postgres release
*/}}
{{- define "postgresRelease" -}}
{{ printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Postgres hostname
*/}}
{{- define "postgresHost" -}}
  {{- if .Values.tags.branch -}}
    {{ include "postgresRelease" . }}
  {{- else -}}
    {{ .Values.postgresql.postgresHost }}
  {{- end -}}
{{- end -}}

{{/*
Postgres password
*/}}
{{- define "postgresPassword" -}}
  {"secretKeyRef": {"name":
  {{- if .Values.tags.branch -}}
    {{ include "postgresRelease" . | quote }}
  {{- else -}}
    "{{ .Chart.Name }}"
  {{- end -}}, "key": "postgres-password"} }
{{- end -}}
