/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  type        = string
  description = "The project to run tests against"
}

variable "pg_ha_name" {
  type        = string
  description = "The name for Cloud SQL instance"
  default     = "tf-pg-ha"
}

variable "pg_ha_external_ip_range" {
  type        = string
  description = "The ip range to allow connecting from/to Cloud SQL"
}

variable "vpc_name" {
  description = "VPC name."
  type        = string
}

variable "vpc_id" {
  description = "VPC id."
  type        = string
}


variable "labels" {
  description = "Labels to assign on the SQL instance."
  type        = map
  default = {}
}

variable "user_name" {
  description = "user name of the SQL instance."
  type        = string
}

variable "user_password" {
  description = "user password of the SQL instance."
  type        = string
}

variable "region" {
  description = "region"
  type = string
}