-- Update Query:
UPDATE HHSA_APP.REF_APT_EPIN_MASTER 
SET PROCUREMENT_AWARD_EPIN = 'x' || PROCUREMENT_AWARD_EPIN || 'x'
WHERE REF_APT_EPIN_ID in 
(
SELECT REF_APT_EPIN_ID
FROM HHSA_APP.REF_APT_EPIN_MASTER
WHERE PROCUREMENT_AWARD_EPIN IN
  (SELECT PROCUREMENT_AWARD_EPIN
  FROM HHSA_APP.REF_APT_EPIN_MASTER
  GROUP BY PROCUREMENT_AWARD_EPIN
  HAVING COUNT(PROCUREMENT_AWARD_EPIN) > 1
  )
AND INTEGRATION_ID NOT LIKE 'MAN%'
)
;
