COMMENT

   **************************************************
   File generated by: neuroConstruct v1.5.1 
   **************************************************

   This file holds the implementation in NEURON of the Cell Mechanism:
   CaR (Type: Channel mechanism, Model: ChannelML based process)

   with parameters: 
   /channelml/@units = SI Units 
   /channelml/notes = ChannelML file containing a single Channel description 
   /channelml/channel_type/@name = CaR 
   /channelml/channel_type/status/@value = stable 
   /channelml/channel_type/status/comment = Equations adapted from Kali 
   /channelml/channel_type/status/contributor/name = Bogl�rka Sz?ke 
   /channelml/channel_type/notes = High-threshold Ca(R) Channel in pyramid neurons 
   /channelml/channel_type/authorList/modelTranslator/name = Bogl�rka Sz?ke 
   /channelml/channel_type/authorList/modelTranslator/institution = PPKE-ITK 
   /channelml/channel_type/authorList/modelTranslator/email = szoboce - at - digitus.itk.ppke.hu 
   /channelml/channel_type/current_voltage_relation/@cond_law = ohmic 
   /channelml/channel_type/current_voltage_relation/@ion = ca 
   /channelml/channel_type/current_voltage_relation/@charge = 2 
   /channelml/channel_type/current_voltage_relation/@default_gmax = 200 
   /channelml/channel_type/current_voltage_relation/@default_erev = 0.080 
   /channelml/channel_type/current_voltage_relation/@fixed_erev = yes 
   /channelml/channel_type/current_voltage_relation/gate[1]/@name = X 
   /channelml/channel_type/current_voltage_relation/gate[1]/@instances = 2 
   /channelml/channel_type/current_voltage_relation/gate[1]/closed_state/@id = X0 
   /channelml/channel_type/current_voltage_relation/gate[1]/open_state/@id = X 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@name = alpha 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@from = X0 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@to = X 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@expr_form = exponential 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@rate = 100 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@scale = 0.02 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[1]/@midpoint = -0.002 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@name = beta 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@from = X 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@to = X0 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@expr_form = exponential 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@rate = 100 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@scale = -0.02 
   /channelml/channel_type/current_voltage_relation/gate[1]/transition[2]/@midpoint = -0.002 
   /channelml/channel_type/current_voltage_relation/gate[2]/@name = Y 
   /channelml/channel_type/current_voltage_relation/gate[2]/@instances = 1 
   /channelml/channel_type/current_voltage_relation/gate[2]/closed_state/@id = Y0 
   /channelml/channel_type/current_voltage_relation/gate[2]/open_state/@id = Y 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@name = tau 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@from = Y0 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@to = Y 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@expr_form = generic 
   /channelml/channel_type/current_voltage_relation/gate[2]/time_course/@expr = (1 / ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) + (10.0 * (exp ((0.5 - 1)  * (v + 0.053) / (- 0.009))))) + 0.02) 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@name = inf 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@from = Y 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@to = Y0 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@expr_form = generic 
   /channelml/channel_type/current_voltage_relation/gate[2]/steady_state/@expr = ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) / ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) + (10.0 * (exp ((0.5 - 1)  * (v + 0.053) / (- 0.009) ... 
   /channelml/channel_type/impl_prefs/table_settings/@max_v = 0.05 
   /channelml/channel_type/impl_prefs/table_settings/@min_v = -0.1 
   /channelml/channel_type/impl_prefs/table_settings/@table_divisions = 3000 

// File from which this was generated: /home/kali/nC_projects/CA1_NEURON/cellMechanisms/CaR/CaR.xml

// XSL file with mapping to simulator: /home/kali/nC_projects/CA1_NEURON/cellMechanisms/CaR/ChannelML_v1.8.1_NEURONmod.xsl

ENDCOMMENT


?  This is a NEURON mod file generated from a ChannelML file

?  Unit system of original ChannelML file: SI Units

COMMENT
    ChannelML file containing a single Channel description
ENDCOMMENT

TITLE Channel: CaR

COMMENT
    High-threshold Ca(R) Channel in pyramid neurons
ENDCOMMENT


UNITS {
    (mA) = (milliamp)
    (mV) = (millivolt)
    (S) = (siemens)
    (um) = (micrometer)
    (molar) = (1/liter)
    (mM) = (millimolar)
    (l) = (liter)
}


    
NEURON {
      

    SUFFIX CaR
    USEION ca WRITE ica VALENCE 2 ?  outgoing current is written
           
        
    RANGE gmax, gion
    
    RANGE Xinf, Xtau
    
    RANGE Yinf, Ytau
    
}

PARAMETER { 
      

    gmax = 0.02 (S/cm2)  ? default value, should be overwritten when conductance placed on cell
    
}



ASSIGNED {
      

    v (mV)
    
    celsius (degC)
          

    ? Reversal potential of ca
    eca (mV)
    ? The outward flow of ion: ca calculated by rate equations...
    ica (mA/cm2)
    
    
    gion (S/cm2)
    Xinf
    Xtau (ms)
    Yinf
    Ytau (ms)
    
}

BREAKPOINT { 
                        
    SOLVE states METHOD cnexp
         

    gion = gmax*((X)^2)*((Y)^1)      

    ica = gion*(v - eca)
            

}



INITIAL {
    
    eca = 80
        
    rates(v)
    X = Xinf
        Y = Yinf
        
    
}
    
STATE {
    X
    Y
    
}

DERIVATIVE states {
    rates(v)
    X' = (Xinf - X)/Xtau
    Y' = (Yinf - Y)/Ytau
    
}

PROCEDURE rates(v(mV)) {  
    
    ? Note: not all of these may be used, depending on the form of rate equations
    LOCAL  alpha, beta, tau, inf, gamma, zeta, temp_adj_X, A_alpha_X, B_alpha_X, Vhalf_alpha_X, A_beta_X, B_beta_X, Vhalf_beta_X, temp_adj_Y, A_tau_Y, B_tau_Y, Vhalf_tau_Y, A_inf_Y, B_inf_Y, Vhalf_inf_Y
        
    TABLE Xinf, Xtau,Yinf, Ytau
 DEPEND celsius
 FROM -100 TO 50 WITH 3000
    
    
    UNITSOFF
    temp_adj_X = 1
    temp_adj_Y = 1
    
            
                
           

        
    ?      ***  Adding rate equations for gate: X  ***
        
    ? Found a parameterised form of rate equation for alpha, using expression: A*exp((v-Vhalf)/B)
    A_alpha_X = 100
    B_alpha_X = 0.02
    Vhalf_alpha_X = -0.002   
    
    ? Unit system in ChannelML file is SI units, therefore need to convert these to NEURON quanities...
    
    A_alpha_X = A_alpha_X * 0.0010   ? 1/ms
    B_alpha_X = B_alpha_X * 1000   ? mV
    Vhalf_alpha_X = Vhalf_alpha_X * 1000   ? mV
          
                     
    alpha = A_alpha_X * exp((v - Vhalf_alpha_X) / B_alpha_X)
    
    
    ? Found a parameterised form of rate equation for beta, using expression: A*exp((v-Vhalf)/B)
    A_beta_X = 100
    B_beta_X = -0.02
    Vhalf_beta_X = -0.002   
    
    ? Unit system in ChannelML file is SI units, therefore need to convert these to NEURON quanities...
    
    A_beta_X = A_beta_X * 0.0010   ? 1/ms
    B_beta_X = B_beta_X * 1000   ? mV
    Vhalf_beta_X = Vhalf_beta_X * 1000   ? mV
          
                     
    beta = A_beta_X * exp((v - Vhalf_beta_X) / B_beta_X)
    
    Xtau = 1/(temp_adj_X*(alpha + beta))
    Xinf = alpha/(alpha + beta)
          
       
    
    ?     *** Finished rate equations for gate: X ***
    

    
            
                
           

        
    ?      ***  Adding rate equations for gate: Y  ***
         
    ? Found a generic form of the rate equation for tau, using expression: (1 / ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) + (10.0 * (exp ((0.5 - 1)  * (v + 0.053) / (- 0.009))))) + 0.02)
    
    ? Note: Equation (and all ChannelML file values) in SI Units so need to convert v first...
    
    v = v * 0.0010   ? temporarily set v to units of equation...
            
    tau = (1 / ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) + (10.0 * (exp ((0.5 - 1)  * (v + 0.053) / (- 0.009))))) + 0.02)
        
    ? Set correct units of tau for NEURON
    tau = tau * 1000 
    
    v = v * 1000   ? reset v
        
    Ytau = tau/temp_adj_Y
     
    ? Found a generic form of the rate equation for inf, using expression: ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) / ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) + (10.0 * (exp ((0.5 - 1)  * (v + 0.053) / (- 0.009))))))
    
    ? Note: Equation (and all ChannelML file values) in SI Units so need to convert v first...
    
    v = v * 0.0010   ? temporarily set v to units of equation...
            
    inf = ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) / ((10.0 * (exp (0.5 * (v + 0.053) / (- 0.009)))) + (10.0 * (exp ((0.5 - 1)  * (v + 0.053) / (- 0.009))))))
         
    
    v = v * 1000   ? reset v
        
    Yinf = inf
          
       
    
    ?     *** Finished rate equations for gate: Y ***
    

         

}


UNITSON


