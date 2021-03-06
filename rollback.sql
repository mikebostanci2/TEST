-- ROLLBACK QUERY: 
UPDATE HHSA_APP.REF_APT_EPIN_MASTER 
SET PROCUREMENT_AWARD_EPIN = SUBSTR(PROCUREMENT_AWARD_EPIN,2, LENGTH(PROCUREMENT_AWARD_EPIN)-2)
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
