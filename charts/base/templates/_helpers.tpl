{{- define "base.fullname" -}}
{{ .Release.Namespace }}-{{ .Release.Name }}
{{ end }}

{{- define "base.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "base.selectorLabels" -}}
app.kubernetes.io/name: {{ .Release.Name }}
app.kubernetes.io/instance: {{ include "base.fullname" . }}
{{- end }}

{{- define "base.labels" -}}
helm.sh/chart: {{ include "base.chart" . }}
{{ include "base.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


