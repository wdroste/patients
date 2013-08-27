package org.sacredheart.report

class IncomeRange {
    Integer start
    Integer end

    static constraints = {
        start nullable: true
        end nullable: true
    }
}
