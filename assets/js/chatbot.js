function handleInitialQuestion(question) {
  switch (question) {
      case 'stubble':
          getBotResponse('What is stubble?');
          break;
      case 'ecoparali':
          getBotResponse('What is Ecoparali?');
          break;
      case 'sell':
          getBotResponse('How can I sell stubble?');
          break;
      default:
          break;
  }
  // Hide initial questions after user clicks one of them
  var initialQuestions = document.getElementById('initialQuestions');
  if (initialQuestions) {
      initialQuestions.style.display = 'none';
  }
}


function sendMessage() {
  var userInput = document.getElementById("userInput").value;
  if (userInput.trim() === "") return;

  var chatbox = document.getElementById("chatbox");
  var userMessage = document.createElement("div");
  userMessage.className = "message user-message";
  userMessage.textContent = userInput;
  chatbox.appendChild(userMessage);

  document.getElementById("userInput").value = "";
  chatbox.scrollTop = chatbox.scrollHeight;

  displayTypingIndicator();

  setTimeout(() => {
      getBotResponse(userInput);
  }, 1000);
}

function displayTypingIndicator() {
  var typingIndicator = document.getElementById("typingIndicator");
  typingIndicator.style.display = "block";
}

function hideTypingIndicator() {
  var typingIndicator = document.getElementById("typingIndicator");
  typingIndicator.style.display = "none";
}

function getBotResponse(userInput) {
  hideTypingIndicator();

  var botMessage = document.createElement("div");
  botMessage.className = "message bot-message";
  if (userInput.toLowerCase().includes("sell") || userInput.toLowerCase().includes("sold")) {
    typeWriter(botMessage, "To sell, the farmer needs to register on the website and provide details about the farmland, crop type, and amount of stubble they have. As quickly as possible, they will be allocated a slot for the pickup of stubble, after which they will receive payment within 15 days.");
} 
else if (userInput.toLowerCase().includes("buy") || userInput.toLowerCase().includes("bought") ) {
  typeWriter(botMessage, "To buy, the buyer will need to specify the amount of stubble needed. Our team will reach out to them soon.");
}
else if (userInput.toLowerCase().includes("list") || userInput.toLowerCase().includes("details")) {
  typeWriter(botMessage, "You can click on the update button and add all the required details.");
}
else if(userInput.toLowerCase().includes("transportation") || userInput.toLowerCase().includes("transport") || userInput.toLowerCase().includes("take")){
  typeWriter(botMessage, "The farmer does not need to worry about transportation; it will be handled through our end.");

}
 
  else if(userInput.toLowerCase().includes("burning")){
    typeWriter(botMessage,"Stubble burning is the practice of intentionally setting fire to these leftover stalks and roots to clear the fields quickly for the next round of planting. This practice is common in many parts of the world, including regions of India, Southeast Asia, and parts of North America.")
  }
 
else if (userInput.toLowerCase().includes("impacts")) {
  typeWriter(botMessage, "Burning stubble causes air pollution,affecting air quality on a regional and even global scale  leading to respiratory problems, cardiovascular issues, and other health problems for humans and animals.");
} 
else if (userInput.toLowerCase().includes("products") || userInput.toLowerCase().includes("substances")) {
  typeWriter(botMessage, "Cutlery,Utensils,Fibre-related substances,Pellets,Textile,Particleboard,Briquettes,Packaging materials,Eco-bricks etc...");
}
else if (userInput.toLowerCase().includes("safe")) {
  typeWriter(botMessage, "Your data will be safe and secure with us");
}
else if (userInput.toLowerCase().includes("secure")) {
  typeWriter(botMessage, "Your data will be safe and secure with us");
}
else if (userInput.toLowerCase().includes("update") || userInput.toLowerCase().includes("add")) {
  typeWriter(botMessage, "After log in,there will be a button to update your information. You can fill in the details and click on the submit button.");
}
else if (userInput.toLowerCase().includes("government")) {
  typeWriter(botMessage, "Govt offers minimal price as a compensation to not burn stubble");
}

else if (userInput.toLowerCase().includes("payment") || userInput.toLowerCase().includes("money")) {
  typeWriter(botMessage, "Payment will be received within 15 days according to your selling quantity.");
}
else if (userInput.toLowerCase().includes("register")) {
  typeWriter(botMessage, "You need to click on register and fill your name, phone number and password and then click on submit.");

}
else if (userInput.toLowerCase().includes("profit")) {
  typeWriter(botMessage, "Farmers can earn money by selling their stubble while also contributing to environmental sustainability.");
}

else if (userInput.toLowerCase().includes("collected") || userInput.toLowerCase().includes("collect")) {
  typeWriter(botMessage, "The company will specify a date which will be received on the registered phone number of the farmer.");
}
else if (userInput.toLowerCase().includes("support") || userInput.toLowerCase().includes("help") || userInput.toLowerCase().includes("contact")) {
  typeWriter(botMessage, "Yes, there is a chatbot. Also,you can reach us on paryavaranpioneers@gmail.com .");
}
else if (userInput.toLowerCase().includes("process") || userInput.toLowerCase().includes("procedure") || (userInput.toLowerCase().includes("use"))) {
  typeWriter(botMessage, "The farmer needs to register and list the details of their stubble and then a slot will be alloted to dedicated for the pick up.");
}
else if (userInput.toLowerCase().includes("ecoparali")) {
  typeWriter(botMessage, "Ecoparali serves as a platform connecting farmers with buyers interested in purchasing stubble. This enables farmers to profit from their leftover crop residue, while companies can acquire it as a raw material for various productions.");
} 
else if (userInput.toLowerCase().includes("stubble")) {
  typeWriter(botMessage, "Stubble refers to the remaining stalks and roots of harvested crops (such as rice, wheat, or maize) left in the field after the main crop has been harvested. ");
} 
  else {
      typeWriter(botMessage, "Can you please provide more details or ask about Ecoparali?");
  }

  var chatbox = document.getElementById("chatbox");
  chatbox.appendChild(botMessage);
  chatbox.scrollTop = chatbox.scrollHeight;
}

function typeWriter(element, text, i = 0) {
  if (i < text.length) {
      element.textContent += text.charAt(i);
      setTimeout(() => typeWriter(element, text, i + 1), 50);
  }
}
