variable "TORBASE_VERSION" {
  # renovate: datasource=docker depName=quay.io/seiferma/tor-base versioning=loose
  default = "0.4.8.20-r0"
}

variable "IRSSI_VERSION" {
  # renovate: datasource=repology depName=alpine_3_22/irssi versioning=loose
  default = "1.4.5-r4"
}

variable "TTYD_VERSION" {
  # renovate: datasource=repology depName=alpine_3_22/ttyd versioning=loose
  default = "1.7.7-r0"
}

variable "ABDUCO_VERSION" {
  # renovate: datasource=repology depName=alpine_3_22/abduco versioning=loose
  default = "0.6-r6"
}

group "default" {
  targets = ["default"]
}

target "default" {
  tags = ["quay.io/seiferma/irssi-tor:${IRSSI_VERSION}", "quay.io/seiferma/irssi-tor:latest"]
  args = {
    TORBASE_VERSION = "${TORBASE_VERSION}"
    IRSSI_VERSION = "${IRSSI_VERSION}"
    TTYD_VERSION = "${TTYD_VERSION}"
    ABDUCO_VERSION = "${ABDUCO_VERSION}"
  }
}

group "test" {
  targets = ["test"]
}

target "test" {
  inherits = ["default"]
  platforms = ["linux/amd64"]
  tags = ["test-image"]
}