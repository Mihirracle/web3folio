// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Portfolio {
//0xDB3bC2db77A1AD99A478283eC4aaFA48e6b62Ab8
  //Project 1 - QmWvxdjzHdipmuFn7pd5nSBKWLpmPgaPcBUcg6jKd2vdpy
  //Project 2 - QmStZvgRHSd5YrD2fg676AyzPWMDPTGsXkwCXMuv3a2JTE
  //Project 3 - QmSmCV5YLs1NAR4LWTuqM2oekiC8MJARjiwiK2KPdBGhRA
  //github Project - Dgdrive3.0, chaiDapp, ethersJS
  //Description- Sochna hai

  //Resume Link - QmUDoo9ntztoaRrYcxuwKL2hZyqx3BNuum4NAokuFCjyek

  //Portfolio Image - QmcevXGrZ9mbKgLmU93dhWiwQwNCwQZ6NqwKcJgrEkRj3c
  //Dates - 10/05/2017 - 18/04/2018, 10/04/2019 - 18/03/2020, 14/12/2021 - 16/06/2025
  //Degree - High School (SSC), Intermediate, B.Tech
  //Knowledge Acquired - Sochna hai
  //Institute Names - Children Public School, Bhavan's junior College, Dwarkadas J. Sanghvi College Of Engineering  
 
    struct Project {
        uint id;
        string name;
        string description;
        string image;
        string githubLink;
    }

    struct Education {
        uint id;
        string date;
        string degree;
        string knowledgeAcquired;
        string instutionName;
    }

    struct Experience {
        uint id;
        string date;
        string post;
        string knowledgeAcquired;
        string companyName;
    }

    Project[] public projects;
    Education[] public educationDetails;
    Experience[] public experienceDetails;

    string public imageLink = "QmcevXGrZ9mbKgLmU93dhWiwQwNCwQZ6NqwKcJgrEkRj3c";
    string public description = "As a blockchain and Web3 aficionado, I am deeply fascinated by the potential of decentralized technologies to transform the world. With a strong technical background and an insatiable curiosity, I explore the intricate workings of blockchain platforms and smart contracts. I see blockchain as more than just a technology; it's a gateway to building trust, transparency, and fairness in our digital interactions. Its ability to disrupt traditional systems excites me, as I envision a future where blockchain empowers individuals and eliminates unnecessary intermediaries.";
    string public resumeLink = "QmUDoo9ntztoaRrYcxuwKL2hZyqx3BNuum4NAokuFCjyek";
    address public manager;

    constructor() {
        manager = msg.sender;
    }

    modifier onlyManager() {
        require(manager == msg.sender, "You are not the manager");
        _;
    }
  
    // Project
    function insertProject(string calldata _name, string calldata _description, string calldata _image, string calldata _githubLink) external onlyManager {
        projects.push(Project(projects.length, _name, _description, _image, _githubLink));
    }

    function changeProject(uint _projectId, string calldata _name, string calldata _description, string calldata _image, string calldata _githubLink) external onlyManager {
        require(_projectId < projects.length, "Invalid project ID");
        projects[_projectId] = Project(_projectId, _name, _description, _image, _githubLink);
    }

    function allProjects() external view returns (Project[] memory) {
        return projects;
    }

    // Education
    function insertEducation(string calldata _date, string calldata _degree, string calldata _knowledgeAcquired, string calldata _instutionName) external onlyManager {
        educationDetails.push(Education(educationDetails.length, _date, _degree, _knowledgeAcquired, _instutionName));
    }

    function changeEducation(uint _educationId, string calldata _date, string calldata _degree, string calldata _knowledgeAcquired, string calldata _instutionName) external onlyManager {
        require(_educationId < educationDetails.length, "Invalid education ID");
        educationDetails[_educationId] = Education(_educationId, _date, _degree, _knowledgeAcquired, _instutionName);
    }

    function allEducationDetails() external view returns (Education[] memory) {
        return educationDetails;
    }

    // Experience
    function insertExperience(string calldata _date, string calldata _post, string calldata _knowledgeAcquired, string calldata _companyName) external onlyManager {
        experienceDetails.push(Experience(experienceDetails.length, _date, _post, _knowledgeAcquired, _companyName));
    }

    function changeExperience(uint _experienceId, string calldata _date, string calldata _post, string calldata _knowledgeAcquired, string calldata _companyName) external onlyManager {
        require(_experienceId < experienceDetails.length, "Invalid experience ID");
        experienceDetails[_experienceId] = Experience(_experienceId, _date, _post, _knowledgeAcquired, _companyName);
    }

    function allExperienceDetails() external view returns (Experience[] memory) {
        return experienceDetails;
    }

    function changeDescription(string calldata _description) external {
        description = _description;
    }

    function changeResumeLink(string calldata _resumeLink) external onlyManager {
        resumeLink = _resumeLink;
    }

    function changeImageLink(string calldata _imageLink) external onlyManager {
        imageLink = _imageLink;
    }

    function donate() public payable {
        payable(manager).transfer(msg.value);
    }
}
