{{- define "television-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "television-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "television-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- define "television-app.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "television-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
microservice: {{ include "television-app.fullname" . }}
{{- end -}}
{{- define "television-app.selectorLabels" -}}
microservice: {{ include "television-app.fullname" . }}
{{- end -}}
{{- define "television-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.name -}}{{ .Values.serviceAccount.name }}{{- else -}}{{ include "television-app.fullname" . }}{{- end -}}
{{- end -}}
