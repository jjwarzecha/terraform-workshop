output "DB_output" {
  value = ["${data.oci_database_db_system_shapes.test_db_system_shapes}",
    "${data.oci_database_db_nodes.db_nodes}",
    "${data.oci_database_db_node.db_node_details}",
    "${data.oci_database_db_homes.db_homes}",
    "${data.oci_database_databases.databases}",
    "${data.oci_database_db_versions.test_db_versions_by_db_system_id}",
    "${data.oci_database_db_systems.db_systems}",
    "${data.oci_database_databases.databases}"]

}
