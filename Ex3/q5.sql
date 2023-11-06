WITH
    partyMembersCount(number, party, membersCount) AS(
    SELECT number, party, COUNT(uid) AS membersCount
    FROM members NATURAL JOIN memberInKnesset
    GROUP BY number, party),

    partyFemaleCount(number, party, femaleCount) AS(
    SELECT number, party, COUNT(gender) AS femaleCount
    FROM members NATURAL JOIN memberInKnesset
    WHERE gender='female'
    GROUP BY number, party)

SELECT PFC.party, PFC.number, (PFC.femaleCount*100)/PMC.membersCount AS femalePercent
FROM partyFemaleCount PFC INNER JOIN partyMembersCount PMC
ON(PFC.number=PMC.number AND PFC.party=PMC.party)
WHERE (PFC.femaleCount+0.0)/PMC.membersCount >= 0.3
ORDER BY PFC.party, PFC.number;
