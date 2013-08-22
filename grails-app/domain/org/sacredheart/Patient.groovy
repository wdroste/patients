package org.sacredheart

class Patient {

    String patientId;
    String firstName;
    String lastName;

    Date dateOfBirth;
    String zipcode;
    Boolean citizen;
    Boolean veteran;
    Gender gender;
    Race race;
    Language language;

    Integer yearlyFamilyIncome;
    Integer numberOfFamily;

    Status status;
    Education education;
    Reference reference;

    static constraints = {
        patientId unique: true, blank: false
        firstName blank: false
        lastName blank: false
    }
}
