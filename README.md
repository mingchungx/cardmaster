# cardmaster

## Description

cardmaster is a credit card churning visionOS application, built for the upcoming Apple Vision Pro at HackHarvard 2023 at Harvard University. On our flight to Boston, we noticed the prevalence of credit card advertisements at every corner of the airport. As the credit card market grows, more and more businesses are spending increasingly more on customer acquisition costs, yet most of the time, users are not engaged to the vast sea of options, and end up not making a decision. Taking advantage of credit cards, and churning them according to your wallet, is at the core of maximizing the potential of your wallet - which cardmaster takes care of for you.


This project uses the following technologies:

Frontend (this repository): Swift, SwiftUI, VisionOS, RealityKit, Alamofire, MVVM design

Backend (nested submodules): Python, NumPy, Bitarray, Flask, Scikit Learn, Pandas, Cohere, Docker

Database: Google Cloud Platform (GCP)


Our frontend uses immersive visionOS computing for a mixed-reality environment. The user can enter demographic information which is displayed in a recommendation feed. The various features of a card - from offers to purpose - are curated for you, and immerse you in a virtual environment. These personally churned credit cards can be saved in a wishlist. For financial advice, the user can also refer to a large-language-model prompt-engineered to provide financial assistance regarding your credit decisions.

Our backend uses a Jaccardian index and a linear regression algorithm to recommend credit cards, based on user demographics. The mathematical model takes a large dataset of user infomation, that is mapped to statistically predictable recommendations based on set union and intersection. For example, we take into account the credit card APR, credit score eligibility, and the various associated tag categories. We also utilize cloud storage and large language models for storage and AI-generated financial advice responses. 


## Installation and Usage

cardmaster is free to clone and use, with the following command, along with all nested submodules found in the "Backend" directory.
```
git clone https://github.com/mingchungx/cardmaster.git
```


## Authors

Mingchung Xia (University of Waterloo) - did visionos stuff

Luke Wang (McGill University) - backend stuff

Cynthia Shen (University of Waterloo) - also backend stuff

Inesh Tickoo (Ohio Wesleyan University) - uiux and web stuff

