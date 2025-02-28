set matsize 11000
			
*Analyses (Experiment 1)

	*Acquisition
	
		use "OS Extinction 1 - AcquisitionCollapsed.dta"
	
		*Slopes (Continuous)
	
			*Quadratic

				mixed DV i.Training##i.OSsalience##i.Stimulus##c.trial##c.trial || ID:
					contrast i.Training##i.OSsalience##i.Stimulus
					margins, dydx(c.trial)
					contrast i.Training#i.OSsalience#i.Stimulus#c.trial#c.trial
					contrast i.Training#i.OSsalience#i.Stimulus#c.trial
					contrast i.Training#i.Stimulus#c.trial#c.trial
					contrast i.Training#i.Stimulus#c.trial
					contrast i.OSsalience#i.Stimulus#c.trial#c.trial
					contrast i.OSsalience#i.Stimulus#c.trial

			
			*Simple Effects
			
				margins i.Stimulus#i.Training#i.OSsalience, dydx(trial) at(trial=0)
				margins i.Stimulus#i.Training#i.OSsalience, dydx(trial) at(trial=0) pwcompare(pveffects)
				
		*Trial-By-Trial (Categorical) to see last trial of Acquisition;
		*this tells us US expectancy for each condition on the last trial of Acquisition (i.e., Reminder trial 4)
		
			mixed DV i.Training##i.OSsalience##i.Stimulus if trial == 10 || ID:
				contrast i.Training##i.OSsalience##i.Stimulus
			
			*Simple Effects
			
				margins i.Stimulus#i.Training#i.OSsalience
				margins i.Stimulus#i.Training#i.OSsalience, pwcompare(pveffects)

	*Extinction
	
		use "OS Extinction 1 - Extinction.dta"

		*Quadratic

			mixed DV i.Training##i.OSsalience##c.trial##c.trial || ID:
				contrast i.Training##i.OSsalience
				margins, dydx(c.trial)
				contrast i.Training#i.OSsalience#c.trial#c.trial
				contrast i.Training#i.OSsalience#c.trial
				contrast i.Training#c.trial#c.trial
				contrast i.Training#c.trial
				contrast i.OSsalience#c.trial#c.trial
				contrast i.OSsalience#c.trial
	
			*Simple Effects
			
				margins i.Training#i.OSsalience, dydx(trial) at(trial=0)
				margins i.Training#i.OSsalience, dydx(trial) at(trial=0) pwcompare(pveffects)	


	*Transfer Test 1
	
		use "OS Extinction 1 - TransferTest1.dta"
		
		mixed DV i.Training##i.OSsalience
			contrast i.Training##i.OSsalience

		*Simple Effects
		
			margins i.Training#i.OSsalience
			margins i.Training#i.OSsalience, pwcompare(pveffects)
			
	*Transfer Test 1 Collapsed (this shows that True/High has a greater transfer decrement ///
	*than PR (collapsed across High and Low), but True/Low does NOT have a greater transfer ///
	*decrement than PR (collapsed across High and Low)
	
		use "OS Extinction 1 - TransferTest1CollapsedHigh.dta"
		use "OS Extinction 1 - TransferTest1CollapsedLow.dta"
		
		mixed DV i.Training
			contrast i.Training

		*Simple Effects
		
			margins i.Training
			margins i.Training, pwcompare(pveffects)

	*Reinforcement Rate
	
		*End of Acquisition (Reminder 2)
		
			use "OS Extinction 1 - ReinfRateAcqCollapsed.dta"
			
			mixed DV i.Training##i.OSsalience##i.Stimulus
				contrast i.Training##i.OSsalience##i.Stimulus

			*Simple Effects
			
				margins i.Stimulus#i.Training#i.OSsalience
				margins i.Stimulus#i.Training#i.OSsalience, pwcompare(pveffects)
				
		*Ab: Acquisition to Extinction (trial 1 is end of Reminder, trial 2 is after Extinction)
		
			use "OS Extinction 1 - ReinfRateAb.dta"
			
			mixed DV i.Training##i.OSsalience##i.trial
				contrast i.Training##i.OSsalience##i.trial

			*Simple Effects
			
				margins i.trial#i.Training#i.OSsalience
				margins i.trial#i.Training#i.OSsalience, pwcompare(pveffects)
		
		
	*Latent Learning
	
		*End of Acquisition
		
			use "OS Extinction 1 - Latent.dta"
			
			mixed DV i.Training##i.OSsalience##i.Question
				contrast i.Training##i.OSsalience##i.Question

			*Simple Effects
			
				margins i.Question#i.Training#i.OSsalience
				margins i.Question#i.Training#i.OSsalience, pwcompare(pveffects)
			
			
	*Computational Modeling of Extinction
	
		use "OS Extinction 1 - All Data.dta"
		
		*Intercept
		
			mixed c.RW_Ext_intercept i.Training##i.OSsalience
				contrast i.Training##i.OSsalience
				
				*Simple Effects
				
					margins i.Training#i.OSsalience
					margins i.Training#i.OSsalience, pwcompare(pveffects)
		
		*Learning Rate
			
			*Without controlling for intercept
			
				mixed RW_Ext_alpha i.Training##i.OSsalience
					contrast i.Training##i.OSsalience
					
					*Simple Effects
				
						margins i.Training#i.OSsalience
						margins i.Training#i.OSsalience, pwcompare(pveffects)
			
			*Controlling for intercept
			
				mixed RW_Ext_alpha c.RW_Ext_intercept i.Training##i.OSsalience
					contrast i.Training##i.OSsalience
					
					*Simple Effects
					
						margins i.Training#i.OSsalience
						margins i.Training#i.OSsalience, pwcompare(pveffects)

			
			

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
*Analyses (Experiment 2)

	*Acquisition
	
		use "OS Extinction 2 - Acquisition.dta"
	
		*Slopes (Continuous)
	
			*Quadratic

				mixed DV i.OSsalience##i.Stimulus##c.trial##c.trial || ID:
					contrast i.OSsalience##i.Stimulus
					margins, dydx(c.trial)
					contrast i.OSsalience#i.Stimulus#c.trial#c.trial
					contrast i.OSsalience#i.Stimulus#c.trial
					contrast i.Stimulus#c.trial#c.trial
					contrast i.Stimulus#c.trial

			
			*Simple Effects
			
				margins i.Stimulus#i.OSsalience, dydx(trial) at(trial=0)
				margins i.Stimulus#i.OSsalience, dydx(trial) at(trial=0) pwcompare(pveffects)
				
		*Trial-By-Trial (Categorical) to see last trial of Acquisition ///
		*this tells us US expectancy for each condition on the last trial of Acquisition (i.e., Reminder trial 4)
		
			mixed DV i.OSsalience##i.Stimulus if trial == 10 || ID:
				contrast i.OSsalience##i.Stimulus
			
			*Simple Effects
			
				margins i.Stimulus#i.OSsalience
				margins i.Stimulus#i.OSsalience, pwcompare(pveffects)

	*Extinction
	
		use "OS Extinction 2 - Extinction.dta"

		*Quadratic

			mixed DV i.OSsalience##c.trial##c.trial || ID:
				contrast i.OSsalience
				margins, dydx(c.trial)
				contrast i.OSsalience#c.trial#c.trial
				contrast i.OSsalience#c.trial
	
			*Simple Effects
			
				margins i.OSsalience, dydx(trial) at(trial=0)
				margins i.OSsalience, dydx(trial) at(trial=0) pwcompare(pveffects)			
				
	*Computational Modeling of Extinction
	
		use "OS Extinction 2 - All Data.dta"
		
		*Intercept
		
			mixed c.RW_Ext_intercept i.OSsalience
				contrast i.OSsalience
				
				*Simple Effects
				
					margins i.OSsalience
					margins i.OSsalience, pwcompare(pveffects)
		
		*Learning Rate
			
			*Without controlling for intercept
			
				mixed RW_Ext_alpha i.OSsalience
					contrast i.OSsalience
					
					*Simple Effects
				
						margins i.OSsalience
						margins i.OSsalience, pwcompare(pveffects)
			
			*Controlling for intercept
			
				mixed RW_Ext_alpha c.RW_Ext_intercept i.OSsalience
					contrast i.OSsalience
					
					*Simple Effects
					
						margins i.OSsalience
						margins i.OSsalience, pwcompare(pveffects)
		
				
				
				
				
	
