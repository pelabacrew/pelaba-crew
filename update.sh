#!/bin/bash

# ==========================================
# KARANG TARUNA - WEBSITE UPDATE
# ==========================================

set -e

REPO_URL="https://github.com/pelabacrew/pelaba-crew.git"
WEBSITE_URL="https://pelabacrew.github.io/pelaba-crew/"

echo ""
echo "=========================================="
echo "   🚀 KARANG TARUNA WEBSITE UPDATER"
echo "=========================================="
echo ""

# Cek Git repository
if [ ! -d ".git" ]; then
    echo "❌ Folder ini bukan Git repository."
    echo "Pastikan kamu menjalankan script dari folder project."
    exit 1
fi

# Cek remote
REMOTE=$(git remote get-url origin 2>/dev/null || true)

if [ "$REMOTE" != "$REPO_URL" ]; then
    echo "❌ Repository tidak sesuai."
    echo ""
    echo "Repository sekarang:"
    echo "$REMOTE"
    echo ""
    echo "Seharusnya:"
    echo "$REPO_URL"
    exit 1
fi

# Ambil branch
BRANCH=$(git branch --show-current)

echo "📁 Project : Karang Taruna"
echo "🌿 Branch  : $BRANCH"
echo "🔗 GitHub  : $REMOTE"
echo ""

# Cek perubahan
if [ -z "$(git status --porcelain)" ]; then
    echo "ℹ️  Tidak ada perubahan."
    echo ""
    echo "Website sudah dalam kondisi terbaru."
    echo ""
    exit 0
fi

# Tampilkan perubahan
echo "📋 File yang berubah:"
echo ""

git status --short

echo ""
echo "------------------------------------------"

# Tambahkan semua perubahan
echo "📦 Menyiapkan file..."
git add .

# Commit message
if [ -n "$1" ]; then
    COMMIT_MESSAGE="$1"
else
    COMMIT_MESSAGE="Update website Karang Taruna"
fi

echo "💾 Commit: $COMMIT_MESSAGE"
git commit -m "$COMMIT_MESSAGE"

echo ""
echo "☁️  Mengirim ke GitHub..."
git push

echo ""
echo "=========================================="
echo "   ✅ UPDATE BERHASIL!"
echo "=========================================="
echo ""
echo "🌐 Website:"
echo "$WEBSITE_URL"
echo ""
echo "💡 Jika perubahan belum terlihat,"
echo "   tekan Ctrl + Shift + R di browser."
echo ""