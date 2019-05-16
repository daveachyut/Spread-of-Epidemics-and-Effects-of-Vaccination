# Spread-of-Epidemics-and-Effects-of-Vaccination

We consider a simple model of an infectious disease spreading on the network that is transmitted when two individuals are in contact (either face-to-face or co-presence). Similar mathematical models can be used to model gossips on social networks, or the propagation of computer viruses in the context of cybersecurity.

The susceptible-infective-recovered (SIR) model on a network

We describe the Kermack-McKendrick epidemic model, also known as the susceptible-infectrecovered (SIR) model.

• If v is susceptible at time t and it is the neighbor of an infected node u, then v can become infected at time t dt with a probability proportional to
  
  _Auvdt;

where Auv is the entry in the adjacency matrix of the contact network, which accounts for the amount of contacts that happened between u and v.

• If v is infected at time t , then v can recover at time t dt with a probability proportional to
  
  μdt : (15)

• If v is recovered (immune) at time t , then its status no longer changes.

Similarly, the parameter μ (also measured in inverse of time units) is the recovery rate: it takes a time interval of 1{μ for node v to recover once it has been infected, or equivalently the mean infectious period is 1/μ. Once a single node is infected, it will infect about _xdydt nodes over the time step dt , where xdy is the average degree of the graph G. In this model, an epidemic will always come to an end when sufficiently many nodes are protected because they have recovered, and gained immunity.

Numerical simulation of the SIR model on a network

To carry out the simulations we need the following variables:
• μ: recovery rate
• dt : time step
• T : time interval for the simulation
• A: adjacency matrix

The source of the infection is a random node v0.

All epidemics are initiated with a source node chosen at random uniformly amongst the set of vertices.

The impact of the epidemic is quantified using the fraction of the number of vertices nr that recovered (and therefore were infected), nr. Such simulations where at least 20% of the population were infected, are considered to be large outbreaks.

Face-to-face contacts might be difficult to obtain; conversely co-presence information is easily available. The comparison of network statistics is interesting, but does not necessarily yield reliable information about the possibility of using the co-presence datasets as surrogates for the face-to-face contact.


Effect of Vaccination

We study a simple model of vaccination where a subset of nodes acquire an immunity to the infection.

These nodes cannot transmit the disease and are never infected.

Conclusion:
- Since, we vaccinate a constant number of people, i.e. 20, the vaccinated people range from 5% to 20% of all people for different datasets.

- This ratio is brings about <25% of change in the spreading of diseases after vaccination.

- As Beta denotes, strength of diseases, the ratio of people vaccinated can be a ratio of that.

- If the disease is unknown / new, the most ideal approach would be to vaccinate around 50% – 75% of population, to really shut out the disease spread.

- This ratio is very much ideal as it requires early diagnosis, as well as abundant availability of vaccine for the disease.

- Finally, vaccinating people with higher degrees, or having vaccination camps at places with high footfall is definitely (vaccination type-2) a better option than randomly vaccinating people (vaccination type-1).

- Future scope, getting more features about the infected people, such as age group, or medical history, might make the task of identifying highly susceptible people, and vaccinating them sooner, as preventive measures.

Reference:
- https://computationallegalstudies.com/2009/10/11/programming-dynamic-modelsin-
python/
