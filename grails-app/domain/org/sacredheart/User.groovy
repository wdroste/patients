package org.sacredheart

class User {
    String email;
    String secret;
    String fullName;

    static constraints = {
        id name: 'email'
        secret(blank: false)
        fullName(blank: false)
    }
}
