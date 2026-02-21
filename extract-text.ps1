# ContractReader - Extract text from contract files for AI analysis
# Usage: .\extract-text.ps1 -FilePath "C:\path\to\contract.pdf"
# Supports: .txt, .pdf (requires pdftotext or iTextSharp), .docx (requires Word)
# Author: @drizzy8423

param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

if (-not (Test-Path $FilePath)) {
    Write-Host "ERROR: File not found: $FilePath"
    exit 1
}

$ext = [System.IO.Path]::GetExtension($FilePath).ToLower()
$text = ""

switch ($ext) {
    ".txt" {
        $text = Get-Content -Path $FilePath -Raw -Encoding UTF8
    }
    ".pdf" {
        # Try pdftotext (Poppler) first
        $pdftotext = Get-Command pdftotext -ErrorAction SilentlyContinue
        if ($pdftotext) {
            $tmpFile = [System.IO.Path]::GetTempFileName() + ".txt"
            & pdftotext $FilePath $tmpFile
            $text = Get-Content $tmpFile -Raw -Encoding UTF8
            Remove-Item $tmpFile -ErrorAction SilentlyContinue
        } else {
            Write-Host "NOTE: pdftotext not found. Install Poppler for PDF support:"
            Write-Host "  winget install --id GnuWin32.Poppler"
            Write-Host "  or: choco install poppler"
            Write-Host ""
            Write-Host "Alternatively, open the PDF and copy-paste the text directly into your chat."
            exit 1
        }
    }
    ".docx" {
        # Try to use Word COM object
        try {
            $word = New-Object -ComObject Word.Application
            $word.Visible = $false
            $doc = $word.Documents.Open($FilePath)
            $text = $doc.Content.Text
            $doc.Close()
            $word.Quit()
        } catch {
            Write-Host "NOTE: Could not open .docx. Make sure Microsoft Word is installed."
            Write-Host "Alternatively, save the file as .txt and re-run."
            exit 1
        }
    }
    default {
        Write-Host "ERROR: Unsupported file type '$ext'. Supported: .txt, .pdf, .docx"
        Write-Host "Tip: Copy-paste the contract text directly into your AI chat for fastest results."
        exit 1
    }
}

if (-not $text -or $text.Trim().Length -eq 0) {
    Write-Host "ERROR: Could not extract text from file."
    exit 1
}

$wordCount = ($text -split '\s+').Count
$charCount = $text.Length

Write-Host ""
Write-Host "================================================="
Write-Host "  ContractReader - Text Extracted"
Write-Host "================================================="
Write-Host "  File       : $FilePath"
Write-Host "  Characters : $charCount"
Write-Host "  Words      : $wordCount"
Write-Host "================================================="
Write-Host ""
Write-Host "--- CONTRACT TEXT BELOW (copy into your AI chat) ---"
Write-Host ""
Write-Output $text
Write-Host ""
Write-Host "--- END CONTRACT TEXT ---"
Write-Host ""
Write-Host "Now paste this into your chat and say: 'Review this contract'"
