WITH partyMembersCount(number, party, memberCount) AS(
SELECT number, party, COUNT(uid) AS memberCount
FROM memberInKnesset
GROUP BY number, party)

SELECT number, party, memberCount
FROM partyMembersCount C1
WHERE memberCount >= ALL(SELECT memberCount
                         FROM partyMembersCount C2
                         WHERE C1.number=C2.number)
ORDER BY number, party;
