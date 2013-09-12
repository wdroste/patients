databaseChangeLog = {

	changeSet(author: "wdroste (generated)", id: "1378956236718-1") {
		createTable(tableName: "patient") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "citizen", type: "VARCHAR(255)")

			column(name: "county", type: "VARCHAR(255)")

			column(name: "date_of_birth", type: "DATETIME")

			column(name: "education", type: "VARCHAR(16)")

			column(name: "first_name", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "gender", type: "VARCHAR(6)")

			column(name: "language", type: "VARCHAR(7)")

			column(name: "last_name", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "marital_status", type: "VARCHAR(14)")

			column(name: "middle_name", type: "VARCHAR(255)")

			column(name: "number_of_family", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "patient_id", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "race", type: "VARCHAR(8)")

			column(name: "screeningResults", type: "VARCHAR(11)")

			column(name: "veteran", type: "VARCHAR(255)")

			column(name: "yearly_family_income", type: "INT")

			column(name: "zipcode", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-2") {
		createTable(tableName: "patient_visit") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "date_of_visit", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "patient_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "type_of_visit", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-3") {
		createTable(tableName: "role") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-4") {
		createTable(tableName: "role_permissions") {
			column(name: "role_id", type: "BIGINT")

			column(name: "permissions_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-5") {
		createTable(tableName: "user") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "full_name", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_hash", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-6") {
		createTable(tableName: "user_permissions") {
			column(name: "user_id", type: "BIGINT")

			column(name: "permissions_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-7") {
		createTable(tableName: "user_roles") {
			column(name: "user_id", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "role_id", type: "BIGINT") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-8") {
		createTable(tableName: "visit_report") {
			column(autoIncrement: "true", name: "id", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true")
			}

			column(name: "version", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "age_range_end", type: "INT")

			column(name: "age_range_start", type: "INT")

			column(name: "citizen", type: "VARCHAR(255)")

			column(name: "description", type: "VARCHAR(1024)") {
				constraints(nullable: "false")
			}

			column(name: "family_income_range_end", type: "INT")

			column(name: "family_income_range_start", type: "INT")

			column(name: "first_name_pattern", type: "VARCHAR(255)")

			column(name: "last_name_pattern", type: "VARCHAR(255)")

			column(name: "last_updated", type: "DATETIME") {
				constraints(nullable: "false")
			}

			column(name: "middle_name_pattern", type: "VARCHAR(255)")

			column(name: "name", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "number_of_family_range_end", type: "INT")

			column(name: "number_of_family_range_start", type: "INT")

			column(name: "patient_id_pattern", type: "VARCHAR(255)")

			column(name: "veteran", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-9") {
		createTable(tableName: "visit_report_countries") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "countries_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-10") {
		createTable(tableName: "visit_report_educations") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "educations_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-11") {
		createTable(tableName: "visit_report_genders") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "genders_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-12") {
		createTable(tableName: "visit_report_languages") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "languages_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-13") {
		createTable(tableName: "visit_report_marital_statuses") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "marital_statuses_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-14") {
		createTable(tableName: "visit_report_races") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "races_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-15") {
		createTable(tableName: "visit_report_screening_results") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "screening_results_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-16") {
		createTable(tableName: "visit_report_visit_types") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "visit_types_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-17") {
		createTable(tableName: "visit_report_zip_codes") {
			column(name: "visit_report_id", type: "BIGINT")

			column(name: "zip_codes_string", type: "VARCHAR(255)")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-18") {
		addPrimaryKey(columnNames: "user_id, role_id", tableName: "user_roles")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-33") {
		createIndex(indexName: "date_of_birth_idx", tableName: "patient", unique: "false") {
			column(name: "date_of_birth")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-34") {
		createIndex(indexName: "first_name_idx", tableName: "patient", unique: "false") {
			column(name: "first_name")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-35") {
		createIndex(indexName: "last_name_idx", tableName: "patient", unique: "false") {
			column(name: "last_name")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-36") {
		createIndex(indexName: "patient_id_idx", tableName: "patient", unique: "false") {
			column(name: "patient_id")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-37") {
		createIndex(indexName: "IDX_ROLE_NAME", tableName: "role", unique: "false") {
			column(name: "name")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-38") {
		createIndex(indexName: "IDX_USER_EMAIL", tableName: "user", unique: "false") {
			column(name: "email")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-39") {
		createIndex(indexName: "name", tableName: "visit_report", unique: "true") {
			column(name: "name")
		}
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-19") {
		addForeignKeyConstraint(baseColumnNames: "patient_id", baseTableName: "patient_visit", baseTableSchemaName: "shcc", constraintName: "FKB0438391A9AD90AC", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "patient", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-20") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "role_permissions", baseTableSchemaName: "shcc", constraintName: "FKEAD9D23B7ED84628", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "role", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-21") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_permissions", baseTableSchemaName: "shcc", constraintName: "FKE693E61024030A08", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-22") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_roles", baseTableSchemaName: "shcc", constraintName: "FK734299497ED84628", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "role", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-23") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_roles", baseTableSchemaName: "shcc", constraintName: "FK7342994924030A08", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "user", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-24") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_countries", baseTableSchemaName: "shcc", constraintName: "FK9514EDDD9F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-25") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_educations", baseTableSchemaName: "shcc", constraintName: "FK30F69FC29F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-26") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_genders", baseTableSchemaName: "shcc", constraintName: "FK2C0A6F3B9F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-27") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_languages", baseTableSchemaName: "shcc", constraintName: "FK9EF52B449F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-28") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_marital_statuses", baseTableSchemaName: "shcc", constraintName: "FK2C68E7C29F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-29") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_races", baseTableSchemaName: "shcc", constraintName: "FKF3DB5F6B9F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-30") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_screening_results", baseTableSchemaName: "shcc", constraintName: "FK6D3B96D69F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-31") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_visit_types", baseTableSchemaName: "shcc", constraintName: "FKA71AD16E9F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}

	changeSet(author: "wdroste (generated)", id: "1378956236718-32") {
		addForeignKeyConstraint(baseColumnNames: "visit_report_id", baseTableName: "visit_report_zip_codes", baseTableSchemaName: "shcc", constraintName: "FK54EB00B19F1B4225", deferrable: "false", initiallyDeferred: "false", onDelete: "NO ACTION", onUpdate: "NO ACTION", referencedColumnNames: "id", referencedTableName: "visit_report", referencedTableSchemaName: "shcc", referencesUniqueColumn: "false")
	}
}
