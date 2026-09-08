const supabaseClient = window.supabase.createClient(
  SUPABASE_URL,
  SUPABASE_PUBLISHABLE_KEY
);

async function checkAuth() {
  const {
    data: { session },
    error
  } = await supabaseClient.auth.getSession();

  if (error || !session) {
    window.location.href = "login.html";
    return;
  }

  const userEmail = document.getElementById("userEmail");

  if (userEmail) {
    userEmail.textContent = session.user.email;
  }
}

async function logout() {
  const { error } = await supabaseClient.auth.signOut();

  if (error) {
    alert("Gagal logout: " + error.message);
    return;
  }

  window.location.href = "login.html";
}

document.addEventListener("DOMContentLoaded", () => {
  checkAuth();

  const logoutButton = document.getElementById("logoutButton");

  if (logoutButton) {
    logoutButton.addEventListener("click", logout);
  }
});
