import org.sacredheart.*

def incomeTable = [22980, 31020, 39060, 47100, 55140, 63180, 71220, 79260];
Patient.list().each { Patient p ->
    if (p.yearlyFamilyIncome && p.numberOfFamily) {
        def povertyIncome;
        if (p.numberOfFamily > incomeTable.size()) {
            povertyIncome = incomeTable[7] + ((incomeIndex - 8) * 8040);
        } else {
            povertyIncome = incomeTable[p.numberOfFamily - 1];
        }
        p.federalPoverty = (p.yearlyFamilyIncome * 200) / povertyIncome;
        p.save(failOnError:true)
        println "Updated patient: ${p.patientId}"
    }
}
0