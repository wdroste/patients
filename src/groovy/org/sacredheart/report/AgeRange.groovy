package org.sacredheart.report

class AgeRange {
    Integer start
    Integer end

    static constraints = {
        start nullable: true
        end nullable: true
    }
}
