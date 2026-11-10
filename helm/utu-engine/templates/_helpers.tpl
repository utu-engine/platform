{{- define "utu-engine.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "utu-engine.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "utu-engine.labels" -}}
app.kubernetes.io/name: {{ include "utu-engine.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}

{{- define "utu-engine.selectorLabels" -}}
app.kubernetes.io/name: {{ include "utu-engine.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "utu-engine.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "utu-engine.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "utu-engine.bootstrapSecretName" -}}
{{- if .Values.secrets.existingSecret }}
{{- .Values.secrets.existingSecret }}
{{- else }}
{{- printf "%s-bootstrap" (include "utu-engine.fullname" .) }}
{{- end }}
{{- end }}


{{- define "utu-engine.image" -}}
{{- $repository := required "image.repository must be set" .Values.image.repository -}}
{{- $digest := trim (default "" .Values.image.digest) -}}
{{- if $digest -}}
{{- if not (regexMatch "^sha256:[0-9a-f]{64}$" $digest) -}}
{{- fail "image.digest must be a full immutable sha256:<64 lowercase hex> reference" -}}
{{- end -}}
{{- printf "%s@%s" $repository $digest -}}
{{- else -}}
{{- $tag := trim (required "image.tag must be set when image.digest is empty" .Values.image.tag) -}}
{{- printf "%s:%s" $repository $tag -}}
{{- end -}}
{{- end }}
