# GCC Compass — Setup, Gemini API & Demo Guide

## What this package contains
- `app.py`: Streamlit dashboard, GCC Explorer, City Comparison and Gemini Research Assistant.
- `data/`: **small synthetic sample records for demonstrating UI only**. These are NOT verified real GCCs or real office-market statistics. Replace with properly sourced public data before claiming real market insight.
- `requirements.txt`: Python dependencies.
- `run_windows.bat`: Windows startup script.
- `GCC_Compass_Assignment_Deck.pptx`: editable presentation.

## Run on Windows (easy way)
1. Right-click the ZIP > **Extract All**. Do not run directly inside the ZIP.
2. Open the extracted `GCC_Compass_Submission` folder. Confirm `app.py`, `requirements.txt`, `run_windows.bat` and `data` are all visible together.
3. Double-click **run_windows.bat**. The first launch installs dependencies and can take a few minutes.
4. Open the address Streamlit prints, normally **http://localhost:8501**.
5. If Windows does not recognize Python, install Python 3.10 or newer from https://www.python.org/downloads/ and enable **Add Python to PATH**, then retry.

## Manual command-line setup
Open the folder in File Explorer, click the address bar, type `cmd`, and press Enter. Then run:

```cmd
python -m pip install -r requirements.txt
python -m streamlit run app.py
```

If you get `Could not open requirements file`, your terminal is in the wrong folder. Use `dir` and navigate to the folder containing `requirements.txt`.

## Create and connect your Gemini API key
1. Visit https://aistudio.google.com/apikey and sign in.
2. **Revoke any key you previously posted in chat or elsewhere.** Create a new private key.
3. Open GCC Compass, then enter the new key into **Gemini API key** in the left sidebar. The app masks the input and does not save it in the project files.
4. Select an available Gemini model, choose reasoning effort and answer length, then go to **Research Assistant** and click **Analyze evidence**.
5. If you receive a model `404 NOT_FOUND`, the model ID is unavailable for your API project. Select **Custom model ID** and enter a model ID that Google AI Studio currently lists as available to your project. See https://ai.google.dev/gemini-api/docs/models.
6. If you receive a quota or rate-limit error, wait or use the local evidence mode. Free-tier access varies by model and account.

**Never put the key in `app.py`, HTML/JavaScript, the ZIP, screenshots or a public GitHub repository.** This application calls Gemini from the Python server, not the browser.

## What the AI actually does
- Finds relevant records in bundled CSVs (local keyword retrieval).
- Sends the selected evidence, not the entire dataset, to Gemini.
- Asks Gemini to provide an executive summary, supporting evidence IDs, trade-offs, missing information and next steps.
- Displays expandable source records. **AI citations are only as reliable as the underlying records.**
- Falls back to local evidence display if the API fails.

The model does **not** automatically browse the live web. It cannot verify that a company is a real GCC just because a record appears in a CSV. The current bundled CSVs are **fictional demo data**; replace them with independently verified records for a substantive external demonstration.

## Suggested live demo
1. Open **Overview** to explain the product.
2. Open **GCC Explorer**, filter by Bengaluru or financial services.
3. Open **City Comparison** to show the UI (sample numbers are synthetic and must not be cited as real facts).
4. Open **Research Assistant** and ask: "Compare Bengaluru and Hyderabad using the records available. Explain what is known, what is uncertain, and what evidence we still need before recommending a city."
5. Show the source/limitation sections and describe how verified company announcements, policy documents and real estate reports would replace the demo data.

## Troubleshooting
- White-on-white input text: refresh the page (`Ctrl+Shift+R`). The updated app includes sidebar text-color overrides.
- `No module named streamlit`: run `python -m pip install -r requirements.txt` in the correct folder.
- `404 NOT_FOUND` for model: choose a currently supported model ID from your AI Studio project.
- `Dataset not found`: keep the `data` directory next to `app.py`.
- API request fails: local evidence mode remains available; check key/model/quota without posting secrets.

## Reference starting points (verify before using externally)
- Google Gemini API: https://ai.google.dev/gemini-api/docs
- Google AI Studio keys: https://aistudio.google.com/apikey
- NASSCOM: https://nasscom.in/
- JLL India insights: https://www.jll.com/en-in/insights
- Karnataka investment portal: https://investkarnataka.co.in/

## Limitations
This is a time-boxed proof of concept. The dataset packaged here is synthetic; no quantitative market conclusion or claim of verified GCC coverage should be made from it. The presentation describes the proposed production product and its validation roadmap, not proven commercial results.
