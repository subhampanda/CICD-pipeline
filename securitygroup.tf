data "aws_db_snapshot" "db_snapshot" {
    most_recent = true
    db_instance_identifier = "db-prepod"
}
# Create new staging DB
resource "aws_db_instance" "db_preuat" {
  instance_class       = "db.t2.micro"
  identifier           = "db-preuat"
  username             = "subham"
  password             = "subham123"

  #snapshot_identifier  = "${data.aws_db_snapshot.db_snapshot.id}"
  #snapshot_identifier  = "subhampan"
  skip_final_snapshot = true
}
