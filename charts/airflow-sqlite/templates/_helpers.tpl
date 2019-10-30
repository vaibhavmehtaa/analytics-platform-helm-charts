{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 24 | trimSuffix "-" -}}
{{- end -}}

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
e.g. username-airflow.example.com
*/}}
{{- define "host" -}}
{{- (printf "%s-%s.%s" .Values.Username .Chart.Name .Values.toolsDomain) | lower -}}
{{- end -}}

{{/*
unidle-key: used by unidler to find airflow-sqlite resources

will be the host if <= 63 characters (no change in old `alpha`
cluster) or the part before the first dot (".") otherwise
(to avoid problems with new, long, domain)

examples:
host="alice-airflow-sqlite.example.com" => returns "alice-airflow-sqlite.example.com"
host="alice-airflow-sqlite.verylongdomain[...]example.com" => returns "alice-airflow-sqlite"
*/}}
{{- define "unidle_key" -}}
    {{- $label := include "host" . -}}
    {{- if gt (len $label) 63 -}}
        {{- $parts := split "." $label -}}
        {{- $label = $parts._0 -}}
    {{- end -}}
    {{- $label | quote -}}
{{- end -}}
