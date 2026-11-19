{{- define "cellphone-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "cellphone-app.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "cellphone-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- define "cellphone-app.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "cellphone-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
microservice: {{ include "cellphone-app.fullname" . }}
{{- end -}}
{{- define "cellphone-app.selectorLabels" -}}
microservice: {{ include "cellphone-app.fullname" . }}
{{- end -}}
{{- define "cellphone-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.name -}}{{ .Values.serviceAccount.name }}{{- else -}}{{ include "cellphone-app.fullname" . }}{{- end -}}
{{- end -}}
