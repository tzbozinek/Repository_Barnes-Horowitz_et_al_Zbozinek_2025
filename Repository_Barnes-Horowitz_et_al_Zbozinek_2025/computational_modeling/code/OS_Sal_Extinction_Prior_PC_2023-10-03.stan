data {
    // Total number of trials
    int<lower=0> N;
    int<lower=0>n_stimuli;
    int n_participants;
    array[N] int participant_index;
    array[N] int trialseq;
    array[N] int<lower=0, upper=1> US;
}


generated quantities {
    // Parameters
    real alpha_group;
    array[n_stimuli] real<lower=0, upper=1> V0_group;
    real<lower=0> tau_alpha;
    real<lower=0> tau_V0;
    vector<lower=0, upper=1>[n_participants] alpha_indiv;
    array[n_participants, n_stimuli] real<lower=0, upper=1> V0_indiv;
    real<lower=0> sigma;

    // Measured data
    array[N] real DV;

    // Draw the priors
    alpha_group = beta_rng(1, 1);
    for (j in 1:n_stimuli) {
        V0_group[j] = beta_rng(1, 1);
    }

    tau_alpha = abs(normal_rng(0, 0.2));
    tau_V0 = abs(normal_rng(0, 0.2));

    for (i in 1:n_participants) {
        alpha_indiv[i] = beta_rng(alpha_group / tau_alpha, (1-alpha_group) / tau_alpha);
        for (j in 1:n_stimuli) {
            V0_indiv[i, j] = beta_rng(V0_group[j] / tau_V0, (1 - V0_group[j]) / tau_V0);
        }
    }

    sigma = abs(normal_rng(0, 0.2));

    // Compute theoretical learning, V
    array[N, n_stimuli] real V;

    for (i in 1:N) {
        for (j in 1:n_stimuli) {
            if (trialseq[i] == 1) {
                V[i, j] = V0_indiv[participant_index[i], j];
            }
            else {
                // pe_V[j] = US[i] - V[i-1, j];
                V[i, j] = V[i - 1, j] + alpha_indiv[participant_index[i]] * (US[i-1] - V[i-1, j]);
            }
        }
    }

    // Likelihood
    for (i in 1:N) {
        DV[i] = normal_rng(sum(V[i]), sigma);
    }
}
