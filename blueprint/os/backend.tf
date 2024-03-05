terraform {
  backend "pg" {
    conn_str    = "postgres://jenkins:jenkins@localhost/terraformstate?sslmode=disable"
    }
}

#terraform {
#backend "local"{}
#}