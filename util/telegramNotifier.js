// utils/telegramNotifier.js
const axios = require('axios');

const BOT_TOKEN = '7851552186:AAFJwU_luHmg69Av4dUkGYpvkYVboZPtSYA';       // <-- reemplaza con tu token
const CHAT_ID = '-4957791361';
//const CHAT_ID = '6825938071';           // <-- reemplaza con tu chat_id
async function notifyTelegram(message) {
  try {
    await axios.post(`https://api.telegram.org/bot${BOT_TOKEN}/sendMessage`, {
      chat_id: CHAT_ID,
      text: message,
      parse_mode: 'Markdown', // Opcional: permite negritas y saltos de línea
    });
  } catch (error) {
    console.error('Error al enviar notificación de Telegram:', error.message);
  }
}

module.exports = notifyTelegram;