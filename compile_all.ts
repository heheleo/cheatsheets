// A handy script that compiles all Typst files into a predefined
// output directory, maintaining the original directory structure.

import { exec } from "child_process";
import { mkdir, readdir } from "fs/promises";
import { join, relative } from "path";
import { promisify } from "util";

const INPUT_DIRECTORIES = ["calc2"];
const OUTPUT_DIRECTORY = "compiled";

const execAsync = promisify(exec);

async function compileFile(inputPath: string, outputPath: string) {
	try {
		await execAsync(`typst compile ${inputPath} ${outputPath} --root .`);
		console.log(`Compiled: ${inputPath} -> ${outputPath}`);
	} catch (error) {
		console.error(`Failed to compile ${inputPath}:`, error);
	}
}

async function main() {
	for (const inputDir of INPUT_DIRECTORIES) {
		const outputDir = join(
			OUTPUT_DIRECTORY,
			inputDir,
		);
		await mkdir(outputDir, { recursive: true });
		
		const files = await readdir(inputDir, { withFileTypes: true });
		for (const file of files) {
			if (file.isFile() && file.name.endsWith(".typ")) {
				const inputPath = join(inputDir, file.name);
				const outputPath = join(outputDir, file.name.replace(/\.typ$/, ".pdf"));
				await compileFile(inputPath, outputPath);
			}
		}
	}
}

main().catch((error) => {
	console.error("An error occurred during compilation:", error);
});
