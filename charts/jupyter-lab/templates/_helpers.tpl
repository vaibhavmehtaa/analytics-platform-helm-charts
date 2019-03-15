{{/*
Create a default fully qualified app name.
We truncate at 24 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 24 | trimSuffix "-" -}}
{{- end -}}


{{/*
Host

e.g. username-jupyter-lab.example.com
*/}}
{{- define "host" -}}
{{- (printf "%s-jupyter-lab.%s" .Values.Username .Values.toolsDomain) | lower -}}
{{- end -}}
