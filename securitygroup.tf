data "aws_db_snapshot" "db_snapshot" {
    most_recent = true
    db_instance_identifier = "db-prod"
}
# Create new staging DB
resource "aws_db_instance" "db_uat" {
  instance_class       = "db.t2.micro"
  identifier           = "db-uat"
  username             = "subham"
  password             = "subham123"

  snapshot_identifier  = "${data.aws_db_snapshot.db_snapshot.id}"

  skip_final_snapshot = true
}
