package org.sacredheart.report

class SizeRange {
    Integer start
    Integer end

    static constraints = {
        start nullable: true
        end nullable: true
    }
}
