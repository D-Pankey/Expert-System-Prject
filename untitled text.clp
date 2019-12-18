
;;;======================================================
;;;   Medical Symptom Checker 
;;;
;;;		This is a simple system which attempts to identify
;;;		what kind of Diabetes a patient may have based on there symtoms.
;;;     The knowledge base expert systems has a  
;;;     collection of accompanied by rules.  
;;;     
;;;     PLEASE NOTE: This symtom checker is not to replace a Doctor. 
;;;     and Symptoms should still be consulted with your local Physician
;;;
;;;     
;;; 
;;;     To execute, merely load, reset, and run.
;;;     Answer questions yes or no.
;;;======================================================
;;;***************************
;;;* DEFTEMPLATE DEFINITIONS *
;;;***************************
(defrule diagnosed_diabetes
(initial-fact)
=>

		(printout t "Have you been diagnosed with Diabetes?" crlf)
		(bind ?answer1 (read))
		(assert (diagnosed-diabetes ?answer1)))

(defrule diagnosed_diabetes_yes
			(diagnosed-diabetes yes)
			=>(
			printout t "Having weightloss?" crlf)
			(bind ?answer2 (read))
			(assert (having-weightloss ?answer2)))
			
(defrule having_weightloss_yes
			(having-weightloss yes)
			=>
			(printout t "Extreme thirst?" crlf)
			(bind ?answer3 (read))
			(assert (extreme-thirst ?answer3)))
(defrule extreme_thirst_yes
			(extreme-thirst yes)
			=>
			(printout t "Diagnosis is: Type1 or Type2 Diabetes" crlf))
(defrule diagnosed_diabetes_no
			(diagnosed-diabetes no)
			=>
			(printout t "This Expert System is only if you have been Diagnosed with Diabetes.  If you feel you may have diabetes please see your local Physician " crlf))			
(defrule having_weightloss_no
			(diagnosed-diabetes yes)
			(having-weightloss no)
			=>
			(printout t "Are you pregnant?" crlf)
			(bind ?answer4 (read))
			(assert (patient-pregnant ?answer4)))
(defrule patient_pregnant_yes
			(patient-pregnant yes)
			=>
			(printout t "Diagnosis is: Gestational Diabetes A form of high blood sugar affecting pregnant women." crlf))
(defrule patient_pregnant_no
			(diagnosed-diabetes yes)
			(having-weightloss no)
			(patient-pregnant no)
			=>
			(printout t "Are you experiencing fatigue?" crlf)
			(bind ?answer5 (read))
			(assert (experience-fatigue ?answer5)))
(defrule experience_fatigue_yes
			(diagnosed-diabetes yes)
			(having-weightloss no)
			(patient-pregnant no)
			(experience-fatigue yes)
			=>
			(printout t "Are you an Adult?" crlf)
			(bind ?answer6 (read))
			(assert (adult-patient ?answer6)))
(defrule adult_patient_no
			(diagnosed-diabetes yes)
			(having-weightloss no)
			(patient-pregnant no)
			(experience-fatigue yes)
			(adult-patient no)
			=>
			(printout t "Are you under 6 months old?" crlf)
			(bind ?answer7 (read))
			(assert (patient-baby ?answer7)))
(defrule adult_patient_yes
			(diagnosed-diabetes yes)
			(having-weightloss no)
			(patient-pregnant no)
			(experience-fatigue yes)
			(adult-patient yes)
			=>
			(printout t "Are you experiencing sharp changes in your blood glucose?" crlf)
			(bind ?answer8 (read))
			(assert (glucose-change ?answer8)))
(defrule glucose_change_no
			(glucose-change no)
			=>
			(printout t "Diagnosis is: Type 1 or Type 2 Diabetes " crlf))
(defrule glucose_change_yes
			(glucose-change yes)
			=>
			(printout t "Diagnosis is: Brittle Diabetes It is characterized by wide variations or “swings” in blood glucose (sugar) in which blood glucose levels can quickly move from too high to too low" crlf))

(defrule patient_baby_no
			(patient-baby no)
			=>
			(printout t "Diagnosis is: Juvenile Diabetes A chronic condition in which the pancreas produces little or no insulin. " crlf))
(defrule patient_baby_yes
			(patient-baby yes)
			=>
			(printout t "Diagnosis is: Neonatal Diabetes.  A rare form of diabetes that is usually diagnosed in children under 6 months of age. " crlf))

(defrule experience_fatigue_no
			(experience-fatigue no)
			=>
			(printout t "You do not have the common symtoms of diabetes please get a second opinion" crlf))
						
(defrule extreme_thirst_no
			(diagnosed-diabetes yes)
			(having-weightloss yes)
			(extreme-thirst no)
			=>
			(printout t "Are you experiencing numbness?" crlf)
			(bind ?answer9 (read))
			(assert (tingling-numbness ?answer9)))
(defrule tingling_numbness_no
			(tingling-numbness no)
			=>(printout t "You're Symtoms are unique and will require blood work to diagnose" crlf))

(defrule tingling_numbness_yes
			(diagnosed-diabetes yes)
			(having-weightloss yes)
			(extreme-thirst no)
			(tingling-numbness yes)
			=>
			(printout t "Are you experiencing Blurry Vision?" crlf)
			(bind ?answer10 (read))
			(assert (blurry-vision ?answer10)))

(defrule blurry_vision_yes
			(diagnosed-diabetes yes)
			(having-weightloss yes)
			(extreme-thirst no)
			(tingling-numbness yes)
			(blurry-vision yes)
			=>
			(printout t "Do you have Brain Fog?" crlf)
			(bind ?answer11 (read))
			(assert (brain-fog ?answer11)))

(defrule brain_fog_yes
			(brain-fog yes)
			=>
			(printout t "Diagnosis is: Diabetes LADA.  LADA occurs because your pancreas stops producing adequate insulin, most likely from some "insult" that slowly damages the insulin-producing cells in the pancreas." crlf))

(defrule brain_fog_no
			(brain-fog no)
			=>
			(printout t "Diagnosis is: Diabetes MODY MODY is a dominant genetic condition, which means that people who inherit one copy of the gene mutation that causes MODY from either their mother or father will be affected." crlf))
(defrule blurry_vision_no
			(blurry-vision no)
			=>(printout t "Diagnosis is: Type 1 or Type 2 Diabetes" crlf))
			
