<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->

<a name="readme-top"></a>

<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />

<div align="center">
  <a href="https://github.com/flock-io">
    <img src="logo.png" alt="Logo">
  </a>

  <h3 align="center">FLock.io Smart Contracts</h3>

  <p align="center">
    Bringing Machine Learning to Web3
    <br />
    <!--a href="https://github.com/othneildrew/Best-README-Template"><strong>Explore the docs »</strong></a-->
    <br />
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template/issues">Report Bug</a>
    ·
    <a href="https://github.com/othneildrew/Best-README-Template/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">Tokenomics</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <!--li><a href="#roadmap">Roadmap</a></li-->
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <!--li><a href="#acknowledgments">Acknowledgments</a></li-->
  </ol>
</details>

<!-- Tokenomics -->

## 1. Tokenomics

![tokenomics1][tokenomics1]
![tokenomics2][tokenomics2]

- Reward Pool is initialized by Task Creator just after a FlockTask contract is deployed.
- Every round it is calculated the amount of reward for that round based on the amount left in the pool and the number of rounds left to run the task.
- Participants can claim their reward for each round base on proportion of staked tokens they hold at the time of the round.

```solidity
uint256 scale = 10 ** 18; // for precision
uint256 roundsLeft = totalNumberOfRounds - i;
uint256 roundRewardAmount = rewardPool / roundsLeft;
uint256 proportion = mulDiv(
    roundStakedTokens[i][msg.sender] * scale,
    100,
    roundTotalStakedTokens[i]
);
uint256 rewardAmount = mulDiv(
    roundRewardAmount,
    proportion,
    100 * scale
);
```

- Slashing is a customizable percentage of participants staked amount where 90% will go back to the Reward Pool and the 10% will go to the

You may download the desktop client of the lastest version [here](https://github.com/FLock-io/client-interface/releases/tag/v0.0.3).

For more detailed technical explanation of the FLock client, see [here](https://docs.flock.io/core-technologies/flock-client/client-deepdown).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 2. Getting Started

### Prerequisites

- node
- npm

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/FLock-io/v1-core-hardhat.git
   ```
2. Install NPM packages
   ```sh
   npm install
   ```
   <p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## 3. Usage

1. To compile contracts:
   ```sh
   npx hardhat compile
   ```
2. To run tests locally:
   ```sh
   npx hardhat test
   ```
3. To deploy contracts locally:
   ```sh
   npm run deploy:local
   ```
4. To deploy contracts to mumbai testnet:
   ```sh
   npm run deploy:testnet
   ```
5. To upgrade contracts to mumbai testnet:
   ```sh
   npm run deploy:upgrade
   ```
6. To deploy ClaimRewards contracts to mumbai testnet:
   ```sh
   npm run deploy:claimRewards
   ```
7. To deploy MigrateTokens contracts to mumbai testnet:
    ```sh
    npm run deploy:migrateTokens
    ```
8. To fund MigrateToken contract with FLO token on mumbai testnet:
    ```sh
    npm run fund:migrateContract
    ```
9. To fund ClaimRewards contract with FLO token on mumbai testnet:
    ```sh
    npm run fund:claimRewards
    ```

_Note that the deployment pipeline defined in `./github/workflows/deploy.yml` deploys the same version of the contract contracts twice - one for testing and one for production. Navigate to Git Actions to view addresses of the deployed contracts. It should look something like this:_

`FlockTaskManager for production is deployed to 0xc002f1802616291B5125BEC6115DA996e70C8D53`

`FlockTaskManager for testing is deployed to 0x2638e0dC9C5ff33b2DfB73E301C9Ac7BbC441d92`

_Be aware that you should always use the second address for testing (for instance, in testing frontend interfaces). The first address should only be used for production._

_Note also that for deployment, see in-line comments in `scripts/deploy.ts` for more detailed instructions._

_See `.env.example` for instructions to set up private keys and necessary API keys in order to deploy to testnets._

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

<!--
## Roadmap

- [x] Add Changelog
- [x] Add back to top links

See the [open issues](https://github.com/flock-io/interface/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->

<!-- CONTRIBUTING -->

## 4. Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## 5. Contact

Rodrigo Pavezi - [@rodrigopavezi](https://twitter.com/rodrigopavezi) - rodrigo@flock.io

Project Link: [https://github.com/FLock-io/v1-core-hardhat](https://github.com/FLock-io/v1-core-hardhat)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

<!--
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

- [Choose an Open Source License](https://choosealicense.com)
- [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
- [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
- [Malven's Grid Cheatsheet](https://grid.malven.co/)
- [Img Shields](https://shields.io)
- [GitHub Pages](https://pages.github.com)
- [Font Awesome](https://fontawesome.com)
- [React Icons](https://react-icons.github.io/react-icons/search)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
-->

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/flock-io/v1-core-hardhat.svg?style=for-the-badge
[contributors-url]: https://github.com/flock-io/v1-core-hardhat/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/flock-io/v1-core-hardhat.svg?style=for-the-badge
[forks-url]: https://github.com/flock-io/v1-core-hardhat/network/members
[stars-shield]: https://img.shields.io/github/stars/flock-io/v1-core-hardhat.svg?style=for-the-badge
[stars-url]: https://github.com/flock-io/v1-core-hardhat/stargazers
[issues-shield]: https://img.shields.io/github/issues/flock-io/v1-core-hardhat.svg?style=for-the-badge
[issues-url]: https://github.com/flock-io/v1-core-hardhat/issues
[license-shield]: https://img.shields.io/github/license/flock-io/v1-core-hardhat.svg?style=for-the-badge
[license-url]: https://github.com/flock-io/v1-core-hardhat/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/company/flock-io/
[product-architecture]: images/architecture.png
[product-sequence]: images/sequence.png
[electron.js]: https://img.shields.io/badge/Electron-191970?style=for-the-badge&logo=Electron&logoColor=white
[electron-url]: https://www.electronjs.org/
[react.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[react-url]: https://reactjs.org/
[styled-components]: https://img.shields.io/badge/styled--components-DB7093?style=for-the-badge&logo=styled-components&logoColor=white
[styled-components-url]: https://styled-components.com/
[tokenomics1]: tokenomics1.png
[tokenomics2]: tokenomics2.png
[ethereum]: https://img.shields.io/badge/Ethereum-3C3C3D?style=for-the-badge&logo=Ethereum&logoColor=white
[ethereum-url]: https://ethereum.org/
