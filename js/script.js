// Création des étoiles
document.addEventListener('DOMContentLoaded', () => {
    const starsContainer = document.querySelector('.stars');
    
    for (let i = 0; i < 50; i++) {
        const star = document.createElement('div');
        star.className = 'star';
        star.style.left = `${Math.random() * 100}%`;
        star.style.top = `${Math.random() * 100}%`;
        star.style.animation = `twinkle ${Math.random() * 3 + 2}s infinite`;
        starsContainer.appendChild(star);
    }


    // Gestion du formulaire
    const form = document.querySelector('.contact-form');
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        // Ajoutez ici votre logique d'envoi de formulaire
    });
});


document.querySelectorAll('.biocontrol-section').forEach(section => {
    section.addEventListener('click', () => {
        // Ferme toutes les autres sections
        document.querySelectorAll('.biocontrol-section').forEach(otherSection => {
            if (otherSection !== section) {
                otherSection.classList.remove('section-expanded');
            }
        });
        
        // Bascule la section cliquée
        section.classList.toggle('section-expanded');
    });
 });

 const questions = [
    {
        number: 1,
        question: "Quelle est la définition principale du biocontrôle ?",
        options: [
            "Une méthode de lutte chimique contre les nuisibles",
            "Une approche utilisant des organismes vivants ou des substances naturelles pour protéger les cultures",
            "Une technique d'intensification des pesticides chimiques",
            "Une méthode visant à augmenter la résistance génétique des plantes"
        ],
        correct: 'B',
        explanation: "Le biocontrôle utilise des organismes vivants et des substances naturelles pour protéger les cultures, offrant une alternative écologique aux pesticides chimiques."
    },
    {
        number: 2,
        question: "Quels sont les principaux agents de biocontrôle ?",
        options: [
            "Les pesticides chimiques et les engrais",
            "Les macro-organismes et les micro-organismes",
            "Les OGM et les hormones de croissance",
            "Les herbicides et les fongicides"
        ],
        correct: 'B',
        explanation: "Les macro-organismes (insectes, acariens) et les micro-organismes (champignons, bactéries) sont les principaux agents naturels utilisés en biocontrôle."
    },
    {
        number: 3,
        question: "Quel est l'avantage principal du biocontrôle ?",
        options: [
            "Il est moins cher que les pesticides chimiques",
            "Il agit plus rapidement sur les ravageurs",
            "Il est plus facile à appliquer",
            "Il respecte l'environnement et la biodiversité"
        ],
        correct: 'D',
        explanation: "Le biocontrôle préserve l'équilibre naturel des écosystèmes tout en protégeant efficacement les cultures, contrairement aux pesticides chimiques."
    },
    {
        number: 4,
        question: "Comment agissent les médiateurs chimiques en biocontrôle ?",
        options: [
            "Ils tuent directement les ravageurs",
            "Ils modifient le comportement des nuisibles",
            "Ils fertilisent le sol",
            "Ils renforcent les plantes"
        ],
        correct: 'B',
        explanation: "Les médiateurs chimiques perturbent le comportement des ravageurs, notamment via des phéromones qui interfèrent avec leur reproduction."
    }
];

let currentQuestion = 0;
let score = 0;

function createQuestionCard(question) {
    return `
        <div class="question-card" id="question-${question.number}">
            <p class="question-number">Question ${question.number} :</p>
            <p class="question-text">${question.question}</p>
            <div class="options">
                ${question.options.map((option, index) => `
                    <div class="option">
                        <span class="option-letter">${String.fromCharCode(65 + index)}.</span>
                        <p>${option}</p>
                    </div>
                `).join('')}
            </div>
            <div class="answer-buttons">
                ${['A', 'B', 'C', 'D'].map(letter => `
                    <button class="answer-btn" onclick="handleAnswer('${letter}')">${letter}</button>
                `).join('')}
            </div>
        </div>
    `;
}

function showQuestion() {
    const quizContent = document.getElementById('quiz-content');
    if (currentQuestion < questions.length) {
        quizContent.innerHTML = createQuestionCard(questions[currentQuestion]);
    } else {
        showFinalScore();
    }
}

function handleAnswer(selectedOption) {
    const question = questions[currentQuestion];
    const buttons = document.querySelectorAll('.answer-btn');
    buttons.forEach(button => {
        button.disabled = true;
        if (button.textContent === question.correct) {
            button.style.background = 'rgba(76, 175, 80, 0.3)';
            button.style.borderColor = '#4CAF50';
        }
    });

    const selectedButton = document.querySelector(`.answer-btn:nth-child(${['A','B','C','D'].indexOf(selectedOption) + 1})`);
    if (selectedOption !== question.correct) {
        selectedButton.style.background = 'rgba(244, 67, 54, 0.3)';
        selectedButton.style.borderColor = '#F44336';
    } else {
        score++;
    }

    const currentCard = document.getElementById(`question-${question.number}`);
    const explanation = document.createElement('div');
    explanation.className = 'result-card ' + (selectedOption === question.correct ? 'correct' : 'incorrect');
    explanation.innerHTML = `
        <h3>${selectedOption === question.correct ? 'Correct !' : 'Incorrect'}</h3>
        <p>${question.explanation}</p>
        ${currentQuestion < questions.length - 1 ? '<button class="next-btn" onclick="nextQuestion()">Question suivante</button>' : '<button class="next-btn" onclick="showFinalScore()">Voir le résultat</button>'}
    `;
    currentCard.appendChild(explanation);
    document.querySelector('.next-btn').style.display = 'inline-block';
}

function nextQuestion() {
    currentQuestion++;
    showQuestion();
}

function showFinalScore() {
    const percentage = (score / questions.length) * 100;
    const quizContent = document.getElementById('quiz-content');
    quizContent.innerHTML = `
        <div class="score-card" style="display: block;">
            <h2 class="score-title">Quiz terminé !</h2>
            <p class="score-text">Votre score : ${score}/${questions.length} (${percentage}%)</p>
            <button class="restart-btn" onclick="restartQuiz()">Recommencer le quiz</button>
        </div>
    `;
}

function restartQuiz() {
    currentQuestion = 0;
    score = 0;
    showQuestion();
}

// Démarrer le quiz
showQuestion();

