#!/bin/bash

REPO_URL="https://github.com/pelabacrew/pelaba-crew.git"
WEBSITE_URL="https://pelabacrew.github.io/pelaba-crew/"

echo ""
echo "🚀 KARANG TARUNA WEBSITE UPDATER"
echo "========================================"
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
    echo "Repository yang seharusnya:"
    echo "$REPO_URL"
    echo ""
    exit 1
fi

echo "📁 Repository : $REMOTE"
echo "🌐 Website    : $WEBSITE_URL"
echo ""

# Cek perubahan
if [ -z "$(git status --porcelain)" ]; then
    echo "✅ Tidak ada perubahan."
    echo "Website sudah dalam kondisi terbaru."
    echo ""
    exit 0
fi

echo "📝 Perubahan ditemukan:"
git status --short
echo ""

# Tambahkan semua perubahan
git add .

# Commit
COMMIT_MESSAGE="Update website $(date '+%Y-%m-%d %H:%M:%S')"

git commit -m "$COMMIT_MESSAGE"

if [ $? -ne 0 ]; then
    echo ""
    echo "❌ Commit gagal."
    exit 1
fi

# Push
echo ""
echo "☁️ Mengirim perubahan ke GitHub..."
echo ""

git push origin main

if [ $? -ne 0 ]; then
    echo ""
    echo "❌ Push ke GitHub gagal."
    exit 1
fi

echo ""
echo "========================================"
echo "🎉 UPDATE BERHASIL!"
echo "========================================"
echo ""
echo "🌐 Website:"
echo "$WEBSITE_URL"
echo ""