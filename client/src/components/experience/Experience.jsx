import { useState, useEffect } from "react";
import './Experience.css'
import { SlCalender } from "react-icons/sl"

const Experience = ({ state }) => {
    const [education, setEducation] = useState("");
    const [experiences, setExperiences] = useState([]);

    useEffect(() => {
        const { contract } = state;
        const fetchData = async () => {
            try {
                const educationData = await contract.methods.allEducationDetails().call();
                setEducation(educationData);

                const experienceData = await contract.methods.allExperienceDetails().call();
                setExperiences(experienceData);
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        }
        contract && fetchData();
    }, [state]);

    return (
        <section className="exp-section">
            <h1 className="title">Experience && Education </h1>

            <div className="container2">
                {/* Education */}
                <div className="education">
                    <h1 className="edu-title">Education🎓</h1>
                    {education !== "" && education.map((edu) => (
                        <div key={edu.id} className="edu-card">
                            <p className="card-text1">
                                <SlCalender className='icon' /> {edu.date}
                            </p>
                            <h3 className="card-text2">{edu.degree}</h3>
                            <p className="card-text3">{edu.knowledgeAcquired}</p>
                            <p className="card-text4">{edu.instutionName}</p>
                        </div>
                    ))}
                </div>
                
                {/* Experience */}
                <div className="experience">
                    <h1 className="exp-title">Experience🧠</h1>
                    {experiences.map((exp) => (
                        <div key={exp.id} className="exp-card">
                            <p className="card-text1">
                                <SlCalender className='icon' /> {exp.date}
                            </p>
                            <h3 className="card-text2">{exp.post}</h3>
                            <p className="card-text3">{exp.knowledgeAcquired}</p>
                            <p className="card-text4">{exp.companyName}</p>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
}

export default Experience;
